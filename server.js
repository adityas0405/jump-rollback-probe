// Minimal fixture app for the P2 rollback probe ("good" candidate).
// No dependencies, no build step -- just Node's built-in http module.
const http = require("http");

const VERSION = process.env.PROBE_VERSION || "good-v1";
const port = process.env.PORT || 3000;

http
  .createServer((req, res) => {
    res.writeHead(200, { "Content-Type": "application/json" });
    res.end(JSON.stringify({ version: VERSION, ok: true }));
  })
  .listen(port, "0.0.0.0", () => {
    console.log(`probe fixture listening on ${port}, version=${VERSION}`);
  });
