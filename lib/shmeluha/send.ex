defmodule Shmeluha.Send do
  import Shmeluha.StandartAnswer, only: [prepare_answer: 1]
  import Shmeluha.Parser, only: [parser: 1]
  alias Shmeluha.Message, as: Msg

  @url "https://api.telegram.org/"
  @token "bot174798506:AAGRrBFEL6aZzEuAJzK6kM9djHH5b6sMPTg"

  def send_answer do
    get_update
    |> parser
    |> update_text
    |> send_message
  end

  def get_update do
    (@url <> @token <> "/getUpdates?offset=-1?limit=1")
    |> make_request
  end

  # %Msg{text: text, id: id} = msg
  def update_text(msg) do
    %Msg{text: prepare_answer(msg.text), id: msg.id}
  end

  def send_message(msg) do
    (@url <>
       @token <>
       "/sendMessage?chat_id=" <>
       Integer.to_string(msg.id) <> "&text=" <> msg.text <> "&api_type=#json")
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
