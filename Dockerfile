FROM directus/directus:9.22.4

COPY snapshots/ ./snapshots/

CMD npx directus bootstrap && npx directus schema apply snapshots/latest.yml --yes && npx directus start
