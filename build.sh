ECR_REGISTRY="011528257712.dkr.ecr.us-east-1.amazonaws.com"
aws ecr get-login-password --region us-east-1 --profile tf-bia-lab | docker login --username AWS --password-stdin $ECR_REGISTRY
docker build -t meddiflux .
docker tag meddiflux:latest $ECR_REGISTRY/meddiflux:latest
docker push $ECR_REGISTRY/meddiflux:latest
