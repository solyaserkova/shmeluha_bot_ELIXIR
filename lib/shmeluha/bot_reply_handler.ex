defmodule Shmeluha.BotReplyHandler do
  require Logger

  @msg_per_period 5

  def reply(%{"message" => %{"text" => text, "chat" => %{"id" => id, "type" => type}}}) do
    Logger.info("sending answer")
    Shmeluha.MsgCounter.increase()
    IO.puts("#{Shmeluha.MsgCounter.value()}")

    if Shmeluha.MsgCounter.value() > @msg_per_period || type == "private",
      do: Shmeluha.BotReply.send_answer(text, id)
  end

  def reply(_) do
    IO.puts("Not matched")
  end
end
