output "repository_url" {
  # Outputs the URL of the ECR repository created for ECS container images
  value = aws_ecr_repository.ce7_grp_2_webapp.repository_url
}
