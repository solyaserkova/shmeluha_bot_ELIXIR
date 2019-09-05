defmodule Shmeluha.Reduplicator do
  @prefixes ["шмапты", "фршма", "рапты", "рыпты", "дранды", "фырфыр", "хуе"]
  @too_long_msg ["ой распизделся", "давай по делу", "меньше слов больше дела", "скука"]

  def reduplicator(text) do
    words =
      text
      |> String.split(" ")
      |> Enum.map(fn word -> change_prefix(word) <> " " end)
      |> check_length
  end

  defp random_prefix, do: Enum.random(@prefixes)

  def check_length(words) do
    dlina = Kernel.length(words)

    cond do
      dlina <= 3 ->
        List.to_string(words)

      dlina > 3 ->
        Enum.random(@too_long_msg)
    end
  end

  def change_prefix(word) do
    Regex.replace(
      ~r/^[бвгджзйклмнпрстфхцчшщ]?[бвгджзйклмнпрстфхцчшщ]?[аоиеёэыуюя]/iu,
      word,
      random_prefix
    )
  end
end
