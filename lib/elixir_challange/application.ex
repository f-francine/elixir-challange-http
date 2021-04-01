defmodule ElixirChallange.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    IO.puts("I AM STARTING THE FUNCTION")
    children = [
      # Starts a worker by calling: ElixirChallange.Worker.start_link(arg)
      # {ElixirChallange.Worker, arg}
      {Plug.Cowboy, scheme: :http, plug: ElixirChallange.Server, options: [port: 4007]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirChallange.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
