defmodule Shmeluha.Poller do
  use GenServer
  require Logger

  def start_link do
    Logger.log(:info, "Started poller")
    GenServer.start_link(__MODULE__, %{update_id: -1}, name: :pooler_server)
  end

  def init(state) do
    spawn(fn ->
      handle_cast(:start_pool, state)
    end)

    {:ok, state}
  end

  def handle_cast(:start_pool, state) do
    do_pool(state)
    {:noreply, state}
  end

  def do_pool(args) do
    %{"update_id" => update_id} = Shmeluha.Bot.getUpdates(args)

    do_pool(%{update_id: update_id + 1})
  end
end
