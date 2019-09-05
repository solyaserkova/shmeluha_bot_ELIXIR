defmodule Shmeluha.Parser do
  alias Shmeluha.Message, as: Msg

  def parser(request) do
    %{
      # "ok" => _status,
      "result" => result
    } = request

    result = List.first(result)

    %{
      "message" => message
      # , "update_id" => _update_id
    } = result

    %{
      # "chat" => _chat,
      # "date" => _date,
      "from" => from,
      # "message_id" => _message_id,
      "text" => text
    } = message

    inc_msg_text = text

    %{
      # "first_name" => _first_name,
      "id" => id
      # , "is_bot" => _is_bot,
      # "language_code" => _language_code,
      # "last_name" => _last_name
    } = from

    sender_id = id

    %Msg{id: sender_id, text: inc_msg_text}
  end

  def loopy([head | tail]) do
    IO.puts("Head: #{head} Tail: #{inspect(tail)}")
    loopy(tail)
  end

  def loopy([]), do: IO.puts("Done!")
end
