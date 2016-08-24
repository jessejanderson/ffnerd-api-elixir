defmodule FFNerd.Mixfile do
  use Mix.Project

  def project do
    [app: :ffnerd,
     version: "0.1.0",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     deps: deps]
  end

  def application do
    [applications: [ :logger, :httpoison, :exconstructor ]]
  end

  defp deps do
    [
      {:credo, "~> 0.3", only: [:dev, :test]},
      {:earmark, "~> 0.1", only: :dev},
      {:ex_doc, "~> 0.11", only: :dev},
      {:exconstructor, "~> 1.0.2"},
      {:exvcr, "~> 0.6", only: :test},
      {:httpoison, "~> 0.8.0"},
      {:meck, "~> 0.8", only: :test},
      {:mix_test_watch, "~> 0.2", only: :dev},
      {:poison, "~> 2.0"},
    ]
  end

  defp description do
    """
    An Elixir wrapper for the Fantasy Football Nerd API (http://www.fantasyfootballnerd.com/fantasy-football-api)
    """
  end

  defp package do
    [
      name: :ffnerd,
      maintainers: ["Jesse J. Anderson"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/jessejanderson/ffnerd-api-elixir"}
    ]
  end
end
