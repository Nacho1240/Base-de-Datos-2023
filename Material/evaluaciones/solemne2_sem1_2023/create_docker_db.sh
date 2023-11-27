docker run --network host --workdir /bdd --volume $(pwd):/bdd --name publicaciones -e POSTGRES_PASSWORD=123 -d postgres:15
