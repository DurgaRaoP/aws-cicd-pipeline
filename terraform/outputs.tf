output "lambda_function_name" {
  value = aws_lambda_function.cicd_demo.function_name
}

output "artifact_bucket" {
  value = aws_s3_bucket.pipeline_artifacts.id
}

output "lambda_arn" {
  value = aws_lambda_function.cicd_demo.arn
}
