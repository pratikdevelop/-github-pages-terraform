output "github_pages_url" {
  description = "URL of the deployed Angular app on GitHub Pages"
  value       = github_actions_workflow.deploy.outputs.github_pages_url
}
