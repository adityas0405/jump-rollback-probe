# Bad candidate, variant A: deliberately broken BUILD.
# `RUN false` fails deterministically and near-instantly (no image layer to
# cache, no dependency install to wait on), which is the fastest way to reach
# Deployment.status=FAILED for a bounded probe. Coolify's own build step
# (docker build / buildx) fails before any container is ever created, so this
# never touches jump-oci.py's runtime classification at all -- it fails purely
# at the BUILDING stage (see backend/API.md's deployment status list).
FROM node:22-alpine
WORKDIR /app
COPY server.js .
RUN false
EXPOSE 3000
CMD ["node", "server.js"]
