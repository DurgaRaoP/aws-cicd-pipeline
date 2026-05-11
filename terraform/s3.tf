resource "aws_s3_bucket" "pipeline_artifacts" {
  bucket        = "${var.project_name}-artifacts-arceus"
  force_destroy = true

  tags = {
    Name    = "PipelineArtifacts"
    Project = var.project_name
  }
}

resource "aws_s3_bucket_versioning" "artifacts_versioning" {
  bucket = aws_s3_bucket.pipeline_artifacts.id
  versioning_configuration {
    status = "Enabled"
  }
}
