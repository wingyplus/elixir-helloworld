defmodule Helloworld.Application do
  use Application

  def start(_type, _args) do
    children = [
      Plug.Cowboy.child_spec(scheme: :http, plug: Helloworld.Router, port: 4001)
    ]

    opts = [strategy: :one_for_one, name: Helloworld.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
