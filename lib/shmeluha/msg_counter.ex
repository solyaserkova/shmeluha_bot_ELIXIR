defmodule Shmeluha.MsgCounter do
  use GenServer
  require Logger

  @name :msg_counter_server

  def start_link do
    Logger.log(:info, "Started msg counter")
    GenServer.start_link(__MODULE__, %{}, name: @name)
  end

  def increase do
    GenServer.cast(@name, :increase)
  end

  def value do
    GenServer.call(@name, :value)
  end

  # server
  # state == message count

  def init(_state) do
    {:ok, 0}
  end

  def handle_cast(:increase, state) do
    {:noreply, state + 1}
  end

  def handle_call(:value, _from, state) do
    {:reply, state, state}
  end
end
