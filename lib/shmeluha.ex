defmodule Shmeluha do
  use Application
  require Logger
  import Supervisor.Spec, warn: false

  def start(_type, _args) do
    Logger.log(:info, "Started app")

    children = [
      worker(Shmeluha.Poller, []),
      worker(Shmeluha.MsgCounter, [])
    ]

    opts = [strategy: :one_for_one, name: Shmeluha.Supervisor]

    Supervisor.start_link(children, opts)
  end
end
