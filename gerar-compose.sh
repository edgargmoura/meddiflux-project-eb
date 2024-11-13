versao=$(git rev-parse HEAD | cut -c 1-7)
echo TAG=$versao > .env
docker compose -f docker-compose-eb.yml config > docker-compose-meddiflux.yml
mv docker-compose-meddiflux.yml docker-compose.yml