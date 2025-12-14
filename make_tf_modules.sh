#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  ./make_tf_modules.sh <module_name> [module_name ...]
Example:
  ./make_tf_modules.sh vpc iam cloudrun

Creates:
  ./modules/<module_name>/{main.tf,variables.tf,outputs.tf}
EOF
}

if [[ $# -lt 1 ]]; then
  usage
  exit 1
fi

ROOT_DIR="modules"
mkdir -p "$ROOT_DIR"

for raw_name in "$@"; do
  # Trim whitespace (basic) and reject empty
  name="$(printf '%s' "$raw_name" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
  if [[ -z "$name" ]]; then
    echo "Skipping empty module name."
    continue
  fi

  # Basic safety: allow typical Terraform module folder names
  # (letters, digits, underscore, dash, dot, slash). Disallow path traversal.
  if [[ ! "$name" =~ ^[A-Za-z0-9._/-]+$ ]] || [[ "$name" == *".."* ]] || [[ "$name" == /* ]]; then
    echo "Invalid module name: '$raw_name' (refusing for safety)" >&2
    exit 2
  fi

  module_dir="${ROOT_DIR}/${name}"
  mkdir -p "$module_dir"

  # Create files only if they don't already exist
  main_tf="${module_dir}/main.tf"
  variables_tf="${module_dir}/variables.tf"
  outputs_tf="${module_dir}/outputs.tf"

  if [[ ! -f "$main_tf" ]]; then
    cat >"$main_tf" <<EOF
/**
 * Module: ${name}
 * Add resources here.
 */
EOF
  fi

  if [[ ! -f "$variables_tf" ]]; then
    cat >"$variables_tf" <<EOF
/**
 * Variables for module: ${name}
 */

# variable "example" {
#   description = "Example variable"
#   type        = string
# }
EOF
  fi

  if [[ ! -f "$outputs_tf" ]]; then
    cat >"$outputs_tf" <<EOF
/**
 * Outputs for module: ${name}
 */

# output "example" {
#   description = "Example output"
#   value       = null
# }
EOF
  fi

  echo "Created: ${module_dir}/(main.tf variables.tf outputs.tf)"
done

