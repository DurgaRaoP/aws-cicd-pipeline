output "lambda_function_name" {
  value = aws_lambda_function.cicd_demo.function_name
}

output "artifact_bucket" {
  value = aws_s3_bucket.pipeline_artifacts.id
}

output "lambda_arn" {
  value = aws_lambda_function.cicd_demo.arn
}

output "pipeline_name" {
  value = aws_codepipeline.lambda_pipeline.name
}

output "codebuild_project" {
  value = aws_codebuild_project.lambda_build.name
}

output "pipeline_console_url" {
  value = "https://ap-south-1.console.aws.amazon.com/codesuite/codepipeline/pipelines/${aws_codepipeline.lambda_pipeline.name}/view"
}
