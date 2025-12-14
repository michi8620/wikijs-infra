output "task_definition_arn" {
  value = aws_ecs_task_definition.wiki.arn
}
 
output "url" {
  description = "Cloud Run service URL"
  value       = try(google_cloud_run_service.wiki.status[0].url, "")
}
