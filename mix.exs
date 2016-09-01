defmodule Pokemon.Mixfile do
  use Mix.Project

  def project do
    [
      app: :pokemon,
      version: "1.0.0",
      elixir: "~> 1.3",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      description: description(),
			package: package(),
      deps: deps(),
      preferred_cli_env: [
        vcr: :test,
        "vcr.delete": :test,
        "vcr.check": :test,
        "vcr.show": :test
      ]
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:httpoison, :logger]]
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
      {:httpoison, "~> 0.9.0"},
      {:exjsx, "~> 3.2"},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:exvcr, "~> 0.7", only: :test}
    ]
  end

  defp description do
    """
    API wrapper around the Pokémon TCG API of pokemontcg.io
    """
  end

  defp package do
    [# These are the default files included in the package
     name: :pokemon_tcg_sdk,
     files: ["lib", "config",  "mix.exs", "README*", "readme*", "LICENSE*", "license*"],
     maintainers: ["William Volin"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/PokemonTCG/pokemon-tcg-sdk-elixir",
              "Website" => "https://pokemontcg.io/"}]
  end

end
