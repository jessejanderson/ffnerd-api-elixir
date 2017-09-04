defmodule FFNerd.Mixfile do
  use Mix.Project

  def project do
    [app: :ffnerd,
     version: "0.2.1",
     elixir: "~> 1.5",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     deps: deps()]
  end

  def application do
    [applications: [ :logger, :httpoison, :exconstructor ]]
  end

  defp deps do
    [
      {:credo, "~> 0.8", only: [:dev, :test], runtime: false},
      {:earmark, "~> 1.2.2", only: :dev},
      {:ex_doc, "~> 0.16", only: :dev, runtime: false},
      {:exconstructor, "~> 1.1.0"},
      {:exvcr, "~> 0.8", only: :test},
      {:httpoison, "~> 0.13"},
      {:meck, "~> 0.8.4", only: :test},
      {:mix_test_watch, "~> 0.3", only: :dev, runtime: false},
      {:poison, "~> 3.1"},
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
