// Same server as good-app, for reference/diff purposes. This file is never
// actually reached by Docker: the build fails at `RUN false` before COPY's
// contents matter for anything except making the diff between good/bad
// obviously small.
const http = require("http");

const VERSION = process.env.PROBE_VERSION || "bad-v1";
const port = process.env.PORT || 3000;

http
  .createServer((req, res) => {
    res.writeHead(200, { "Content-Type": "application/json" });
    res.end(JSON.stringify({ version: VERSION, ok: true }));
  })
  .listen(port, "0.0.0.0", () => {
    console.log(`probe fixture listening on ${port}, version=${VERSION}`);
  });
