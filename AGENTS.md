# Repository Guidelines

## Project Structure & Module Organization
Source lives under `terraform/`. The root contains shared provider, backend, and default variable definitions that all environments inherit. Environment entrypoints sit in `terraform/environments/{dev,prod}`, each exposing its own `main.tf`, `variables.tf`, `outputs.tf`, and optional `terraform.tfvars` for secrets. Reusable building blocks (VPC, Cloud SQL, Cloud Run, load balancer, etc.) live in `terraform/modules/*`; keep new infrastructure logic encapsulated there and wire it up from the environment-specific roots.

## Build, Test, and Development Commands
- `terraform fmt -recursive terraform`: normalize HCL formatting before every commit.
- `terraform -chdir=terraform/environments/dev init`: initialize providers/state for the chosen environment (swap `dev` for `prod` as needed).
- `terraform -chdir=terraform/environments/dev validate`: catch syntax and provider configuration issues.
- `terraform -chdir=terraform/environments/dev plan -var-file=terraform.tfvars`: review concrete changes that will hit GCP. Pair with `apply` only after peer review.

## Coding Style & Naming Conventions
Use Terraform 1.0+ syntax with two-space indentation and trailing commas avoided. Name resources with the `wiki-<component>-<environment>` pattern already visible in modules (e.g., `wiki-network-dev`) so GCP assets stay discoverable. Variables should be `snake_case`, outputs `snake_case`, and module input names kept consistent between root and module definitions. Run `terraform fmt` locally or configure your editor to apply it on save.

## Testing Guidelines
Testing relies on Terraform’s native validation and planning. Always run `terraform fmt -check` and `terraform validate` inside each touched environment. Plans should be captured (e.g., `terraform plan -out=dev.plan`) and attached to reviews for traceability; reject applies if the stored plan drifts from the approved diff. If you introduce new modules, add lightweight sanity checks by instantiating them in a scratch environment before promoting changes.

## Commit & Pull Request Guidelines
Commits follow short, imperative summaries similar to `Create README.md`; describe what you changed and the scope (e.g., `Add cloudrun autoscaling variables`). Group logically related infrastructure edits per commit to simplify rollback. Pull requests should include: purpose, environments touched, sample `plan` output, and any manual steps (such as enabling APIs). Link tracking issues when applicable and call out potential cost or downtime risks so reviewers can plan mitigations.

## Security & Configuration Tips
Never commit populated `terraform.tfvars`; keep them in a local-only or secret storage solution and reference via `-var-file`. Configure the backend in `terraform/backend.tf` before running `init` in CI so remote state is centralized. Rotate service-account keys used by Terraform regularly and scope IAM permissions just to the modules you enable.
