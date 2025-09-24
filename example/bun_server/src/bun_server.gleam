import conversation.{Text}
import gleam/http/response
import gleam/javascript/promise
import gleam/option.{None}
import hinoto
import hinoto/runtime/bun

pub fn main() -> Nil {
  bun.serve(hinoto.fetch(handler), None, None)
}

fn handler(hinoto) {
  use _req <- hinoto.handle(hinoto)

  response.new(200)
  |> response.set_body(Text("<h1>Hello, Hinoto with Bun!</h1>"))
  |> response.set_header("content-type", "text/html")
  |> promise.resolve
}
