./build.sh
API_ENDPOINT=https://prd-meddiflux.aws-imersao.com.br
REACT_APP_API_URL=$API_ENDPOINT SKIP_PREFLIGHT_CHECK=true npm run build --prefix client
echo '>> Fazendo deploy dos assets'
aws s3 sync client/build s3://meddiflux-assets-eb/prd --exclude "index.html" --profile tf-bia-lab

echo '>> Fazendo deploy do index.html'
aws s3 sync client/build s3://meddiflux-assets-eb/prd --exclude "*" --include "index.html" --profile tf-bia-lab