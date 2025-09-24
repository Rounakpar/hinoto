////
//// Runtime module for Node.js
////
//// This module provides utilities for running Hinoto applications in the Node.js runtime.
//// It handles the setup and configuration of HTTP servers specifically for Node.js,
//// utilizing the Hono.js Node.js adapter.
////

import conversation.{type JsRequest, type JsResponse}
import gleam/int
import gleam/io
import gleam/javascript/promise.{type Promise}
import gleam/option.{type Option, None, Some}

/// Default port used when none is specified
const default_port = 3000

/// Server address information provided by Node.js when the server starts
///
/// This type contains information about the address the server is bound to,
/// including the IP address, address family, and port number.
pub type Info {
  Info(address: String, family: String, port: Int)
}

/// External FFI function that interfaces with Node.js HTTP server via Hono.js adapter
@external(javascript, "./ffi.node.mjs", "serve")
fn hono_serve(
  fetch: fn(JsRequest) -> Promise(JsResponse),
  port: Int,
  callback: fn(Info) -> Nil,
) -> Nil

/// Starts an HTTP server using Node.js runtime
///
/// This function provides a convenient interface to start a server with optional
/// port and callback configuration. If values are not provided, defaults will be used.
/// The callback function is called when the server successfully starts listening.
///
/// ## Parameters
///
/// - `fetch`: A function that handles incoming HTTP requests and returns a Promise of JsResponse
/// - `port`: Optional port number to listen on (defaults to 3000)
/// - `callback`: Optional callback function called when server starts (defaults to logging the URL)
///
/// ## Examples
///
/// ```gleam
/// import hinoto/runtime/node
/// import gleam/option.{Some, None}
/// import gleam/io
///
/// // Start server with default settings
/// node.serve(my_fetch_handler, None, None)
///
/// // Start server on specific port
/// node.serve(my_fetch_handler, Some(8080), None)
///
/// // Start server with custom callback
/// let custom_callback = fn(info) {
///   io.println("Server running on port " <> int.to_string(info.port))
/// }
/// node.serve(my_fetch_handler, Some(8080), Some(custom_callback))
/// ```
///
pub fn serve(
  fetch: fn(JsRequest) -> Promise(JsResponse),
  port: Option(Int),
  callback: Option(fn(Info) -> Nil),
) {
  case port, callback {
    Some(port), None -> hono_serve(fetch, port, default_callback)
    None, Some(callback) -> hono_serve(fetch, default_port, callback)
    Some(port), Some(callback) -> hono_serve(fetch, port, callback)
    None, None -> hono_serve(fetch, default_port, default_callback)
  }
}

/// Default callback function used when no custom callback is provided
///
/// This function logs a message indicating the server is listening and provides
/// the localhost URL for easy access during development.
fn default_callback(info: Info) {
  io.println("Listening on http://localhost:" <> int.to_string(info.port))
}
