resource "aws_lambda_function" "cicd_demo" {
  filename      = "placeholder.zip"
  function_name = "${var.project_name}-demo"
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.11"
  timeout       = 30

  environment {
    variables = {
      APP_VERSION = var.app_version
      DEPLOYED_AT = timestamp()
    }
  }

  lifecycle {
    ignore_changes = [filename, source_code_hash]
  }

  tags = {
    Name    = "CICDDemo"
    Project = var.project_name
  }
}
