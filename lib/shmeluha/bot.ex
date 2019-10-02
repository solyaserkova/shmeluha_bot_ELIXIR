defmodule Shmeluha.Bot do
  @url "https://api.telegram.org/"
  @token "bot174798506:AAGRrBFEL6aZzEuAJzK6kM9djHH5b6sMPTg/"

  # возвращает id последнего сообщения боту в формате %{“update_id” => update_id }
  def getUpdates(%{update_id: offset}) do
    Shmeluha.Bot.exec_cmd("getUpdates", %{offset: offset}) |> process_updates
  end

  # запрос к API
  def exec_cmd(cmd, params) do
    case get(cmd, params) do
      {:ok, %{status_code: 200, body: body}} ->
        %{"ok" => true, "result" => result} = Poison.decode!(body)
        result

      {:error, %{reason: reason}} ->
        reason
    end
  end

  def process_updates([h | tail]) do
    process_update(h)
    process_updates(tail)
  end

  def process_updates([update]) do
    process_update(update)
    update
  end

  def process_updates([]) do
    %{"update_id" => 0}
  end

  def process_update(update) do
    spawn(fn ->
      Shmeluha.BotReplyHandler.reply(update)
    end)
  end

  def get(cmd, params) do
    (@url <> @token <> cmd)
    |> URI.parse()
    |> Map.put(:query, URI.encode_query(params))
    |> URI.to_string()
    |> HTTPoison.get()
  end
end
