defmodule Shmeluha.MixProject do
  use Mix.Project

  def project do
    [
      app: :shmeluha,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      # the mod key of an application resource file configures an application callback module and start argument
      mod: {Shmeluha, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:poison, "~> 3.1"},
      {:httpoison, "~> 1.5.1"}
    ]
  end
end
