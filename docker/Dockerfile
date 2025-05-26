FROM python:3.12-slim as builder
WORKDIR /app
COPY . .
RUN mkdir -p /app/results/gothic_1 /app/results/gothic_2

RUN PYTHONPATH=/app:$PYTHONPATH ./process_scripts.sh
RUN PYTHONPATH=/app:$PYTHONPATH python3 ./mappers/postgres/prepare.py

FROM postgres:15 as dumper

COPY --from=builder /app/mappers/postgres/01-schema.sql /docker-entrypoint-initdb.d/
COPY --from=builder /app/mappers/postgres/02-data.sql /docker-entrypoint-initdb.d/
COPY --from=builder /app/mappers/postgres/03-npc-guilds.sql /docker-entrypoint-initdb.d/

COPY --from=builder /app/mappers/postgres/sjp-ispell-pl-20250301/polish.affix /usr/share/postgresql/15/tsearch_data/polish.affix
COPY --from=builder /app/mappers/postgres/sjp-ispell-pl-20250301/polish.dict /usr/share/postgresql/15/tsearch_data/polish.dict
COPY --from=builder /app/mappers/postgres/sjp-ispell-pl-20250301/polish.stopwords.txt /usr/share/postgresql/15/tsearch_data/polish.stop

RUN ["sed", "-i", "s/exec \"$@\"/echo \"skipping...\"/", "/usr/local/bin/docker-entrypoint.sh"]

ENV POSTGRES_PASSWORD=postgres
ENV PGDATA=/data

RUN ["/usr/local/bin/docker-entrypoint.sh", "postgres"]

# final build stage
FROM postgres:15

COPY --from=dumper /data /var/lib/postgresql/data
COPY --from=dumper /usr/share/postgresql/15/tsearch_data /usr/share/postgresql/15/tsearch_data