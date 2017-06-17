defmodule Hangman.Mixfile do
  use Mix.Project

  def project do
    [
      app:     :hangman,
      version: "0.1.0",
      elixir:  "~> 1.5-dev",
      deps:    deps(),
      start_permanent: Mix.env == :prod,
    ]
  end

  def application do
    [
      mod: {
        Hangman.Application, []
      },
      extra_applications: [
        :logger
      ],
    ]
  end

  defp deps do
    [
      { :dictionary, path: "../dictionary" },      
    ]
  end
end
