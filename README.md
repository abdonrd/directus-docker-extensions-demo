# directus-demo

## Prerequisites

- [Docker](https://www.docker.com)

## Start the development server

This command serves the application:

    docker compose up

## Update the schema snapshot

    docker compose exec directus npx directus schema snapshot /directus/snapshots/latest.yml
