defmodule NiedzielaElixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  def start(_type, _args) do
    children = [
      # Starts a worker by calling: NiedzielaElixir.Worker.start_link(arg)
      # {NiedzielaElixir.Worker, arg}
      {Plug.Cowboy, scheme: :http, plug: NiedzielaElixir.Router, options: [port: cowboy_port()]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: NiedzielaElixir.Supervisor]

    Logger.info("Starting application...")

    Supervisor.start_link(children, opts)
  end

  defp cowboy_port, do: Application.get_env(:niedziela_elixir, :cowboy_port, 8080)
end
