defmodule Shmeluha.MsgCounter do
  use GenServer
  require Logger

  @name :msg_counter_server
  @period_seconds 60

  defmodule Counter do
    defstruct current_count: 0, count_list: []
  end

  def start_link do
    Logger.log(:info, "Started msg counter")
    GenServer.start_link(__MODULE__, %Counter{}, name: @name)
  end

  def increase do
    GenServer.cast(@name, :increase)
  end

  def value do
    GenServer.call(@name, :value)
  end

  def state do
    GenServer.call(@name, :state)
  end

  # server
  # state == message count

  def init(state) do
    spawn(fn -> tick_loop() end)
    {:ok, state}
  end

  def tick_loop do
    :timer.sleep(1000)

    send(:msg_counter_server, :tick)
    tick_loop()
  end

  def handle_info(:tick, %Counter{current_count: cc, count_list: cl} = state) do
    new_cl = [cc | cl] |> Enum.take(@period_seconds)
    new_current_count = 0

    {:noreply, %{state | current_count: new_current_count, count_list: new_cl}}
  end

  def handle_cast(:increase, %Counter{current_count: cc, count_list: cl}) do
    new_cc = cc + 1

    {:noreply, %Counter{current_count: new_cc, count_list: cl}}
  end

  def handle_call(:value, _from, %Counter{count_list: cl} = state) do
    result = cl |> Enum.sum()
    {:reply, result, state}
  end

  def handle_call(:state, _from, state) do
    {:reply, state, state}
  end
end
