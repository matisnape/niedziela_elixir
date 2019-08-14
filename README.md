# NiedzielaElixir

This is an attempt to rewrite https://github.com/matisnape/niedziela into Elixir.

## TODO
- Find out how to pass data to Router
- Write a module for handling calculations based on current date
- Write a module for defining closed
- Update view with variables
- Handle scrape with Floki https://github.com/philss/floki
- I18n - https://github.com/elixir-lang/gettext
- Write tests

## Config

`mix deps.get`
`mix run --no-halt`

Go to http://localhost:8080

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `niedziela_elixir` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:niedziela_elixir, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/niedziela_elixir](https://hexdocs.pm/niedziela_elixir).

