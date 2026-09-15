# Good candidate: builds and starts cleanly, serves an HTTP version string.
# A root-level Dockerfile makes Jump's detectFramework() classify this as
# DOCKERFILE (backend/lib/source/detect.ts:~124-150) with no jump.yaml needed --
# Jump takes the exposed port from EXPOSE and leaves Coolify to run the image's
# own CMD (backend/lib/providers.ts:1508-1514, "GENERIC_OTHER"/"DOCKERFILE" case
# returns input.config?.start, i.e. undefined here).
FROM node:22-alpine
WORKDIR /app
COPY server.js .
EXPOSE 3000
CMD ["node", "server.js"]
