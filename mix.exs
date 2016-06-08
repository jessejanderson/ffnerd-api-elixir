defmodule FFNerd.Mixfile do
  use Mix.Project

  def project do
    [app: :ffnerd,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [ :logger, :httpoison, :exconstructor ]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:credo, "~> 0.3", only: [:dev, :test]},
      {:earmark, "~> 0.1", only: :dev},
      {:ex_doc, "~> 0.11", only: :dev},
      {:exconstructor, "~> 1.0.2"},
      {:exvcr, "~> 0.6", only: :test},
      {:httpoison, "~> 0.8"},
      {:meck, "~> 0.8", only: :test},
      {:mix_test_watch, "~> 0.2", only: :dev},
      {:poison, "~> 2.0"},
    ]
  end
end
