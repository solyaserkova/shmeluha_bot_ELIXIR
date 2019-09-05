defmodule Shmeluha.Poller do
  use GenServer
  require Logger

  def start_link do
    Logger.log(:info, "Started poller")
    GenServer.start_link(__MODULE__, %{update_id: 0}, name: :pooler_server)
  end

  def init(state) do
    Logger.log(:info, "INIT")

    spawn(fn ->
      handle_cast(:start_pool, state)
    end)

    {:ok, state}
  end

  def handle_cast(:start_pool, state) do
    Logger.log(:info, "HANDLE_CAST")
    do_pool(state)
    {:noreply, state}
  end

  def do_pool(args) do
    Logger.log(:info, "DO_POOL")
    %{"update_id" => update_id} = Shmeluha.Bot.getUpdates(args)

    do_pool(%{update_id: update_id + 1})
  end
end
