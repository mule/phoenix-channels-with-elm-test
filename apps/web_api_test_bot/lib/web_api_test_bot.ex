defmodule WebApiTestBot do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      supervisor(WebApiTestBot.HeartbeatSupervisor, [])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: WebApiTestBot.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
