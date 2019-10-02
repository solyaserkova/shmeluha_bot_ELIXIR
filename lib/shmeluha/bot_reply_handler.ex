defmodule Shmeluha.BotReplyHandler do
  require Logger

  def reply(%{"message" => %{"text" => text, "chat" => %{"id" => id}}}) do
    Logger.info("sending answer")
    Shmeluha.MsgCounter.increase()
    IO.puts("#{Shmeluha.MsgCounter.value()}")

    if Shmeluha.MsgCounter.value() > 20, do: Shmeluha.BotReply.send_answer(text, id)
  end

  def reply(_) do
    IO.puts("Not matched")
  end
end
