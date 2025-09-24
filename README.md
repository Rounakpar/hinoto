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


## ⬇️ Install

`gleam.toml`の`dependencies`にhinotoとhinoto_cliの依存を追記します。

```toml
hinoto = { git = "https://github.com/Comamoca/hinoto" }
hinoto_cli = { git = "https://github.com/Comamoca/hinoto_cli" }
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
