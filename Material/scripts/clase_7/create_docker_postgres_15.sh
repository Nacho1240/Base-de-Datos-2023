docker run --network host --workdir /bdd --volume $(pwd):/bdd --name docker-postgres15 -e POSTGRES_PASSWORD=123 -d postgres:15
