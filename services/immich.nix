{
  config,
  home-manager,
  ...
}:
let
  # populating variables with .env
  UPLOAD_LOCATION="/mnt/immich/library";
  DB_DATA_LOCATION="/mnt/immich/postgres";
  TZ="Etc/UTC";
  IMMICH_VERSION="release";
  DB_PASSWORD="postgres"; # runs not publicly, can put this here

  DB_USERNAME="postgres";
  DB_DATABASE_NAME="immich";
in
{
#  ## Ad-hoc approach to dockeres on nix
#  home.file = {
#    "docker/immich/docker-compose.yml".text = ''
#      name: immich
#
#      services:
#        immich-server:
#          container_name: immich_server
#          image: ghcr.io/immich-app/immich-server:${IMMICH_VERSION}
#          volumes:
#            - ${UPLOAD_LOCATION}:/mnt/immich/src/app/upload
#            - /etc/localtime:/etc/localtime:ro
#          env_file:
#            - .env
#          ports:
#            - 2283:3001
#          depends_on:
#            - redis
#            - database
#          restart: always
#
#      
#        immich-machine-learning:
#          container_name: immich_machine_learning
#          image: ghcr.io/immich-app/immich-machine-learning:${IMMICH_VERSION}
#          volumes:
#            - model-cache:/cache
#          restart: always
#      
#        redis:
#          container_name: immich_redis
#          image: docker.io/redis:6.2-alpine@sha256:328fe6a5822256d065debb36617a8169dbfbd77b797c525288e465f56c1d392b
#          restart: always
#      
#        database:
#          container_name: immich_postgres
#          image: docker.io/tensorchord/pgvecto-rs:pg14-v0.2.0@sha256:90724186f0a3517cf6914295b5ab410db9ce23190a2d9d0b9dd6463e3fa298f0
#          environment:
#            POSTGRES_PASSWORD: ${DB_PASSWORD}
#            POSTGRES_USER: ${DB_USERNAME}
#            POSTGRES_DB: ${DB_DATABASE_NAME}
#            POSTGRES_INITDB_ARGS: '--data-checksums'
#          volumes:
#            - ${DB_DATA_LOCATION}:/mnt/immich/postgresql/data
#          command: ["postgres", "-c" ,"shared_preload_libraries=vectors.so", "-c", 'search_path="$$user", public, vectors', "-c", "logging_collector=on", "-c", "max_wal_size=2GB", "-c", "shared_buffers=512MB", "-c", "wal_compression=on"]
#          restart: always
#      
#      volumes:
#        model-cache:
#      '';
#
#    "docker/immich/.env".text = ''
#      UPLOAD_LOCATION=/mnt/immich/data/immich
#      DB_DATA_LOCATION=/mnt/immich/postgres
#
#      IMMICH_VERSION=release
#
#      DB_PASSWORD=postgres
#
#      DB_USERNAME=postgres
#      DB_DATABASE_NAME=immich
#    '';
#  };
}
