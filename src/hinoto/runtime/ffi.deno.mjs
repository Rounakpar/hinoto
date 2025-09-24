export function serve(fetch, port, hostname) {
  Deno.serve(
    { port: port, hostname: hostname },
    fetch,
  );
}
