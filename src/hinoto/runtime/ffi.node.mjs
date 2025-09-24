import { serve as hono_serve } from "@hono/node-server";

export function serve(fetch, port, callback) {
  try {
    const server = hono_serve({ fetch, port }, callback);

    // Handle server errors properly
    server.on("error", (err) => {
      if (err.code === "EADDRINUSE") {
        console.error(
          `Error: Port ${port} is already in use. Please try a different port or stop the process using port ${port}.`,
        );
        process.exit(1);
      } else {
        console.error("Server error:", err);
        process.exit(1);
      }
    });

    return server;
  } catch (err) {
    console.error("Failed to start server:", err);
    process.exit(1);
  }
}
