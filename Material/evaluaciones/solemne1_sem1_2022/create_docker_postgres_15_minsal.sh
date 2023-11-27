docker run --network host --workdir /bdd --volume $(pwd):/bdd --name minsal-db -e POSTGRES_PASSWORD=123 -d postgres:15
