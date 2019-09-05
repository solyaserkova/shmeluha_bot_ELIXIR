defmodule Shmeluha do
  use Application
  require Logger
  import Supervisor.Spec, warn: false

  # the start/2 callback has to spawn and link a supervisor and return {:ok, pid} or {:ok, pid, state}
  def start(_type, _args) do
    Logger.log(:info, "Started app")

    children = [
      worker(Shmeluha.Poller, [])
    ]

    opts = [strategy: :one_for_one, name: Shmeluha.Supervisor]

    Supervisor.start_link(children, opts)
  end
end
