<div align="center">

![Last commit](https://img.shields.io/github/last-commit/Comamoca/baserepo?style=flat-square)
![Repository Stars](https://img.shields.io/github/stars/Comamoca/baserepo?style=flat-square)
![Issues](https://img.shields.io/github/issues/Comamoca/baserepo?style=flat-square)
![Open Issues](https://img.shields.io/github/issues-raw/Comamoca/baserepo?style=flat-square)
![Bug Issues](https://img.shields.io/github/issues/Comamoca/baserepo/bug?style=flat-square)

<img src="https://emoji2svg.deno.dev/api/🔥" alt="fire" height="100">

# Hinoto

A web framework written in Gleam, designed for multiple JavaScript runtimes!

</div>

<div align="center">

</div>

## ✨ Features

- 🌐 Support multi runtimes\
  Supports JavaScript runtimes supported by Gleam (Node.js, Deno, Bun) and CloudFlare Workers.
- 🧩 Module first\
  Features are divided into modules, generating JavaScript that is advantageous for Tree-shaking. Additionally, no extra FFI code is mixed in during bundling.
- 🔧 Custom context\
  The `Hinoto` type can contain arbitrary context, allowing runtime-specific information to be handled in the same way.

## 🚀 How to use

You can easily set up a server running on CloudFlare Workers using [hinoto/cli](https://github.com/comamoca/hinoto_cli).

```sh
gleam deps download
# Setup project for CloudFlare workers
gleam run -m hinoto/cli -- workers init

# Preview
wrangler dev
```

Write code like the following in `./src/{project name}.gleam`.
Note that if you answered "yes" to the question `Do you want to overwrite {project name}.gleam with a minimal server example?` in hinoto/cli, a working server is already written.

```gleam
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
```

## ⬇️ Install

Add dependencies for hinoto and hinoto_cli to the `dependencies` section of `gleam.toml`.

```toml
hinoto = { git = "https://github.com/Comamoca/hinoto", ref = "main" }
hinoto_cli = { git = "https://github.com/Comamoca/hinoto_cli", ref = "main" }
```

```sh
gleam run -m hinoto/cli -- workers init
wrangler dev
```

## ⛏️ Development

For developing with various target JavaScript runtimes and CloudFlare Workers, `wrangler` is required.

```sh
cd example/

# For CF Workers
cd workers
wrangler dev

# For node.js
cd node_server

# For deno
cd deno_server

# For bun
cd bun_server

```

## 📝 Todo

- [ ] Support for WinterJS
- [ ] Add middleware

## 📜 License

MIT

### 🧩 Modules

- [gleam_stdlib](https://hexdocs.pm/gleam_stdlib)
- [conversation](https://hexdocs.pm/conversation)
- [gleam_javascript](https://hexdocs.pm/gleam_javascript)
- [gleam_http](https://hexdocs.pm/gleam_http)

## 👏 Affected projects

- [glen](https://hexdocs.pm/glen/index.html)

## 💕 Special Thanks

- [Hono](https://hono.dev/)
