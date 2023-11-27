docker run --workdir /bdd --volume $(pwd):/bdd --name docker-postgres -e POSTGRES_PASSWORD=mysecretpassword -d postgres:15.0q
