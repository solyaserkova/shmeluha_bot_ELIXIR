defmodule Shmeluha.BotReplyHandler do
  def reply(%{"message" => %{"text" => text, "chat" => %{"id" => id}}}) do
    Shmeluha.MsgCounter.increase()
    if Shmeluha.MsgCounter.value() < 10, do: Shmeluha.BotReply.send_answer(text, id)
  end

  def reply(_) do
    IO.puts("Not matched")
  end
end
