defmodule Shmeluha.StandartAnswer do
  import Shmeluha.Reduplicator, only: [reduplicator: 1]

  def prepare_answer(message) do
    cond do
      Regex.match?(~r/ааа|хуе|хуй/iu, message) ->
        Enum.random([
          "ты чо охуел?",
          "слышь парень не дерзи",
          "РОТ твой пусть пойдет нахуй",
          "аааааааааааа"
        ])

      Regex.match?(~r/сам|ты/iu, message) ->
        Enum.random([
          "ты чо охуел?",
          "слышь парень не дерзи",
          "зато я с твоей мамкой",
          "твоя мамка таких любит"
        ])

      Regex.match?(~r/прив|здра|утро|вечер|день|ночь/iu, message) ->
        Enum.random([
          "опять ты?",
          "лучше бы ты нахуй пошел",
          "всего хуевого",
          "аааааааааааа"
        ])

      Regex.match?(~r/ткнись|кnнись/iu, message) ->
        "сам заткнись"

      Regex.match?(~r/не п[ие]зди/iu, message) ->
        "сам не пезди"

      Regex.match?(~r/чо|че/iu, message) ->
        "чочо, раптычо!"

      Regex.match?(~r/кофе/iu, message) ->
        "кофе-чукофе"

      Regex.match?(~r/ебать/iu, message) ->
        "ебать-ебать"

      Regex.match?(~r/заепал/iu, message) ->
        "не гони"

      Regex.match?(~r/^йо$|^qj$/iu, message) ->
        "йо)"

      Regex.match?(~r/орать/iu, message) ->
        Enum.random(["дай поорать", "aaaaaaaaaaaaAAAAAaAAA"])

      Regex.match?(~r/ебись/iu, message) ->
        "ну-ну"

      Regex.match?(~r/пошел/iu, message) ->
        "иди иди"

      Regex.match?(~r/смешно?/iu, message) ->
        "да смешно"

      Regex.match?(~r/будешь/iu, message) ->
        "коенчно буду"

      Regex.match?(~r/будет/iu, message) ->
        "Шмелюх будешь нет?"

      Regex.match?(~r/300/iu, message) ->
        Enum.random([
          "кто скажет шуточку про тракториста?",
          "прально отсоси у тракториста",
          "ну сам знаешь что дальше"
        ])

      Regex.match?(~r/буду/iu, message) ->
        "и я буду"

      Regex.match?(~r/огреб/iu, message) ->
        Enum.random(["да это ты шмелюха огреб", "огреб и зассал", "ой все"])

      Regex.match?(~r/чается/iu, message) ->
        "сам ты качаешься"

      Regex.match?(~r/катушек.*слетел/iu, message) ->
        "сам ты с катушек слетел"

      Regex.match?(~r/^а?$/iu, message) ->
        "а? а? а? а? а? аа?а? а? а? а?"

      Regex.match?(~r/рот/iu, message) ->
        "РОТ"

      Regex.match?(~r/уволю/iu, message) ->
        "я тебя сам уволю"

      Regex.match?(~r/аебал/iu, message) ->
        "аибалы"

      Regex.match?(~r/лох/iu, message) ->
        "сам ты лох"

      Regex.match?(~r/работал?/iu, message) ->
        Enum.random(["я пиздец работал, уработался просто", "а ты работал?", "я нет)"])

      Regex.match?(~r/^че$/iu, message) ->
        "капчо"

      Regex.match?(~r/говн|ебл|мож.?т|увол|лошок|пер.*нивай|брило|пяч|банулс/iu, message) ->
        "РОТ твой"

      Regex.match?(~r/передразнивай/iu, message) ->
        "РОТ твой передразнивает"

      Regex.match?(~r/устал/iu, message) ->
        "посиди если устал"

      Regex.match?(~r/ори/iu, message) ->
        Enum.random(["сам не ори", "да поорать", "рот твой пусть не орет"])

      Regex.match?(~r/уволен/iu, message) ->
        Enum.random([
          "Кораллыч уволен!",
          "Кораллыч ты уволен!",
          "уволю всех нахуй!",
          "уволен и все тут"
        ])

      Regex.match?(~r/бот\s*$/iu, message) ->
        "сам ты бот"

      Regex.match?(~r/притих/iu, message) ->
        Enum.random(["да ты сам притих", "слышь", "слышь не начинай", "ой ну тебя"])

      Regex.match?(~r/как ты .*люх/iu, message) ->
        Enum.random(["лучше всех", "да нормас", "лучше чем ты", "заебись)"])

      Regex.match?(~r/эй/iu, message) ->
        Enum.random(["иди нах", "че эй то?", "че ты эйкаешь?", "иди куда шел"])

      Regex.match?(~r/да .*лю[шхк]+/iu, message) ->
        "раптыда Валер"

      Regex.match?(~r/ой .*лю[шхк]+/iu, message) ->
        "ой Валера.."

      Regex.match?(~r/[пизда]{4}/iu, message) ->
        "джигурда"

      Regex.match?(~r/^да\W*$/iu, message) ->
        Enum.random(["да", "нет", "джигурда", "че ты дакаешь то?", "ну ну", "манда", "нет", "пфф"])

      Regex.match?(~r/люх/iu, message) ->
        Enum.random(["шмелюх", "ой насмешил", "илюшк", "шмелюшк", "шмелюшка", "илюшка", "илюшк?"])

      true ->
        Enum.random([
          reduplicator(message),
          reduplicator(message),
          reduplicator(message),
          reduplicator(message),
          "я устал"
        ])
    end
  end
end
