import conversation.{Text}
import gleam/http/response
import gleam/javascript/promise
import hinoto.{type DefaultContext, type Hinoto}

pub fn main(hinoto: Hinoto(DefaultContext)) -> Hinoto(DefaultContext) {
  use _req <- hinoto.handle(hinoto)

  response.new(200)
  |> response.set_body(Text("<h1>Hello!</h1>"))
  |> response.set_header("content-type", "text/html")
  |> promise.resolve
}
