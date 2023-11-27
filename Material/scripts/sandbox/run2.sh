docker run \
-it \
--rm \
--network host \
--entrypoint /bin/bash \
--workdir /db \
--volume $(pwd):/db \
--user="root"  \
--name postgres_14_5 \
postgres:14.5

