defmodule Shmeluha.BotReply do
  import Shmeluha.StandartAnswer, only: [prepare_answer: 1]

  @url "https://api.telegram.org/"
  @token "bot174798506:AAGRrBFEL6aZzEuAJzK6kM9djHH5b6sMPTg"

  def send_answer(text, id) do
    text
    |> prepare_answer
    |> send_message(id)
  end

  def send_message(text, id) do
    (@url <>
       @token <>
       "/sendMessage?chat_id=" <>
       Integer.to_string(id) <> "&text=" <> text <> "&api_type=#json")
    |> make_request
  end

  def make_request(url) do
    case HTTPoison.get(url) do
      {:ok, %{status_code: 200, body: body}} ->
        Poison.decode!(body)

      {:error, %{reason: reason}} ->
        reason
    end
  end
end
