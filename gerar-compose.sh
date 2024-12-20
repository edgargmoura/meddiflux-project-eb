versao=$(git rev-parse HEAD | cut -c 1-7)
echo TAG=$versao > .env
docker compose -f docker-compose-eb.yml config --no-normalize > docker-compose-meddiflux.yml
sed -i '/^name:/d' docker-compose-meddiflux.yml
sed -i '/server:$/a \    env_file: .env' docker-compose-meddiflux.yml
mv docker-compose-meddiflux.yml docker-compose.yml