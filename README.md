# AWS CI/CD Pipeline — Automated Lambda Deployment

A fully automated CI/CD pipeline on AWS. Every push to GitHub
automatically triggers deployment to Lambda — zero manual steps.

## Architecture

![Architecture Diagram](screenshots/architecture-diagram.png)

## How It Works

1. Developer pushes code to **GitHub** main branch
2. **CodePipeline** detects the change via webhook within seconds
3. Source stage downloads code and stores in **S3** artifact bucket
4. **CodeBuild** runs buildspec.yml — packages Lambda into zip
5. CodeBuild runs `aws lambda update-function-code` to deploy
6. **Lambda** is live with new code within 90 seconds of push
7. Build logs streamed to **CloudWatch Logs** in real time

## Services Used

| Service | Purpose |
|---|---|
| CodePipeline | Orchestrates the pipeline stages |
| CodeBuild | Builds and packages Lambda code |
| S3 | Stores build artifacts between stages |
| Lambda | The function being deployed automatically |
| IAM | Least-privilege roles for Pipeline and Build |
| CloudWatch | Build logs and monitoring |
| Terraform | Full infrastructure as code — 9 resources |

## Project Structure

aws-cicd-pipeline/
├── buildspec.yml              # CodeBuild instructions
├── lambda/
│   └── lambda_function.py    # Lambda function code
├── terraform/
│   ├── main.tf                # Provider config
│   ├── variables.tf           # Input variables
│   ├── outputs.tf             # Output values
│   ├── s3.tf                  # Artifact bucket
│   ├── iam.tf                 # Pipeline and Build roles
│   ├── lambda.tf              # Lambda function
│   ├── codebuild.tf           # CodeBuild project
│   └── codepipeline.tf        # Pipeline definition
└── screenshots/

## How to Deploy

```bash
git clone https://github.com/DurgaRaoP/aws-cicd-pipeline.git
cd aws-cicd-pipeline/terraform
terraform init
terraform apply -var="github_token=YOUR_TOKEN"
```

## Testing the Pipeline

```bash
# Make a code change
nano lambda/lambda_function.py

# Push to GitHub — pipeline triggers automatically within 60 seconds
git add . && git commit -m "update" && git push

# Verify new code is live
aws lambda invoke \
  --function-name aws-cicd-pipeline-demo \
  --region ap-south-1 \
  --payload '{}' response.json
cat response.json
```

## Author

**Pusalapati Durga Rao**
AWS Certified Solutions Architect Associate Training | Terraform | Python
[LinkedIn](https://linkedin.com/in/durgarao-p) | [GitHub](https://github.com/DurgaRaoP)
