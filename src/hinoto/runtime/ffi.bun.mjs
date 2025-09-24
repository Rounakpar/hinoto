export function serve(fetch, port, hostname) {
  const server = Bun.serve({
    port: port,
    hostname: hostname,
    fetch,
  });
  console.log(`Listening on http://localhost:${server.port}`);
}
