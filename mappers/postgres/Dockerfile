FROM postgres:15 as dumper

COPY 01-schema.sql /docker-entrypoint-initdb.d/
COPY 02-data.sql /docker-entrypoint-initdb.d/
COPY 03-npc-guilds.sql /docker-entrypoint-initdb.d/

COPY sjp-ispell-pl-20250301/polish.affix /usr/share/postgresql/15/tsearch_data/polish.affix
COPY sjp-ispell-pl-20250301/polish.dict /usr/share/postgresql/15/tsearch_data/polish.dict
COPY sjp-ispell-pl-20250301/polish.stopwords.txt /usr/share/postgresql/15/tsearch_data/polish.stop

RUN ["sed", "-i", "s/exec \"$@\"/echo \"skipping...\"/", "/usr/local/bin/docker-entrypoint.sh"]

ENV POSTGRES_PASSWORD=postgres
ENV PGDATA=/data

RUN ["/usr/local/bin/docker-entrypoint.sh", "postgres"]

# final build stage
FROM postgres:15

COPY --from=dumper /data /var/lib/postgresql/data
COPY --from=dumper /usr/share/postgresql/15/tsearch_data /usr/share/postgresql/15/tsearch_data