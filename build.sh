versao=$(git rev-parse HEAD | cut -c 1-7)
ECR_REGISTRY="011528257712.dkr.ecr.us-east-1.amazonaws.com"
aws ecr get-login-password --region us-east-1 --profile tf-bia-lab | docker login --username AWS --password-stdin $ECR_REGISTRY
docker build -t meddiflux-eb .
docker tag meddiflux-eb:latest $ECR_REGISTRY/meddiflux-eb:$versao
docker push $ECR_REGISTRY/meddiflux-eb:$versao
./gerar-compose.sh
rm meddiflux-versao-*zip
zip -r meddiflux-versao-$versao.zip docker-compose.yml
git checkout docker-compose.yml
rm .env
