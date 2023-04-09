FROM postgres:15 as dumper

COPY 01-schema.sql /docker-entrypoint-initdb.d/
COPY 02-data.sql /docker-entrypoint-initdb.d/

RUN ["sed", "-i", "s/exec \"$@\"/echo \"skipping...\"/", "/usr/local/bin/docker-entrypoint.sh"]

ENV POSTGRES_PASSWORD=postgres
ENV PGDATA=/data

RUN ["/usr/local/bin/docker-entrypoint.sh", "postgres"]

# final build stage
FROM postgres:15

COPY --from=dumper /data /var/lib/postgresql/data
