////
//// Runtime module for Bun
////
//// This module provides utilities for running Hinoto applications in the Bun runtime.
//// It handles the setup and configuration of HTTP servers specifically for Bun.
////

import conversation.{type JsRequest, type JsResponse}
import gleam/javascript/promise.{type Promise}
import gleam/option.{type Option, None, Some}

/// Default hostname used when none is specified
const default_hostname = "0.0.0.0"

/// Default port used when none is specified
const default_port = 3000

/// External FFI function that interfaces with Bun's HTTP server
@external(javascript, "./ffi.bun.mjs", "serve")
fn bun_serve(
  fetch: fn(JsRequest) -> Promise(JsResponse),
  port: Int,
  hostname: String,
) -> Nil

/// Starts an HTTP server using Bun's runtime
///
/// This function provides a convenient interface to start a server with optional
/// port and hostname configuration. If values are not provided, defaults will be used.
///
/// ## Parameters
///
/// - `fetch`: A function that handles incoming HTTP requests and returns a Promise of JsResponse
/// - `port`: Optional port number to listen on (defaults to 3000)
/// - `hostname`: Optional hostname to bind to (defaults to "0.0.0.0")
///
/// ## Examples
///
/// ```gleam
/// import hinoto/runtime/bun
/// import gleam/option.{Some, None}
///
/// // Start server with default settings
/// bun.serve(my_fetch_handler, None, None)
///
/// // Start server on specific port
/// bun.serve(my_fetch_handler, Some(8080), None)
///
/// // Start server with custom hostname and port
/// bun.serve(my_fetch_handler, Some(8080), Some("localhost"))
/// ```
///
pub fn serve(
  fetch: fn(JsRequest) -> Promise(JsResponse),
  port: Option(Int),
  hostname: Option(String),
) {
  case port, hostname {
    Some(port), Some(hostname) -> bun_serve(fetch, port, hostname)
    Some(port), None -> bun_serve(fetch, port, default_hostname)
    None, Some(hostname) -> bun_serve(fetch, default_port, hostname)
    None, None -> bun_serve(fetch, default_port, default_hostname)
  }
}
