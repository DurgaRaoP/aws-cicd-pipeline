variable "aws_region" {
  default = "ap-south-1"
}

variable "project_name" {
  default = "aws-cicd-pipeline"
}

variable "github_owner" {
  description = "Your GitHub username"
  default     = "DurgaRaoP"
}

variable "github_repo" {
  description = "GitHub repo name"
  default     = "aws-cicd-pipeline"
}

variable "github_branch" {
  default = "main"
}

variable "github_token" {
  description = "GitHub Personal Access Token"
  sensitive   = true
}

variable "app_version" {
  default = "1.0.0"
}
