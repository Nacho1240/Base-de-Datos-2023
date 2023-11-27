docker run --network host --workdir /bdd --volume $(pwd):/bdd --name docker-postgres14_5 -e POSTGRES_PASSWORD=123 -d postgres:14.5
