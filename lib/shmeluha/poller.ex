defmodule Shmeluha.Poller do
  use GenServer
  require Logger

  # создание процесса, в котором начнется поллинг
  def start_link do
    Logger.log(:info, "Started poller")
    GenServer.start_link(__MODULE__, %{update_id: 0}, name: :pooler_server)
  end

  # создание изолированного процесса: стартует процесс сервера бота, в котором посылается сообщение «самому себе»
  def init(state) do
    spawn(fn ->
      handle_cast(:start_pool, state)
    end)

    {:ok, state}
  end

  # обработка сообщения из init и вызов функции do_pool
  def handle_cast(:start_pool, state) do
    do_pool(state)
    {:noreply, state}
  end

  # вызывается функция getUpdates (где происходит запрос к апи телеграмма)
  # ID последнего апдейта матчится и используется в повторном(рекурсивном) вызове функции
  def do_pool(args) do
    %{"update_id" => update_id} = Shmeluha.Bot.getUpdates(args)

    do_pool(%{update_id: update_id + 1})
  end
end
