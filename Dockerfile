FROM node:18-alpine AS builder

WORKDIR /builder

COPY package.json package-lock.json ./
COPY extensions/ extensions/
RUN npm ci
RUN npm run build

FROM directus/directus:9.22.4

COPY snapshots/ ./snapshots/
COPY --from=builder /builder/extensions/directus-extension-extension-name/ ./extensions/directus-extension-extension-name/
# COPY --from=builder /builder/extensions/directus-extension-extension-name-2/ ./extensions/directus-extension-extension-name-2/

CMD npx directus bootstrap && npx directus schema apply snapshots/latest.yml --yes && npx directus start
