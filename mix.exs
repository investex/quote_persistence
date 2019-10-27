defmodule Quote.Persistence.MixProject do
  use Mix.Project

  def project do
    [
      app: :quote_persistence,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      preferred_cli_env: [espec: :test],
      deps: deps(),
      elixirc_paths: elixirc_paths(Mix.env),
      aliases: aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Quote.Persistence.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto_sql, "~> 3.0"},
      {:postgrex, ">= 0.0.0"},
      {:ex_machina, "~> 2.3", only: [:test, :dev]},
      {:faker, "~> 0.13", only: [:test, :dev]},
      {:espec, "~> 1.7.0", only: :test}
    ]
  end

  # This makes sure your factory and any other modules in test/support are compiled
  # when in the test environment.
  defp elixirc_paths(params) when params in [:dev, :test],
    do: [
      "lib",
      "spec/support",
      "spec/factories"
    ]

  defp elixirc_paths(_), do: ["lib"]

  defp aliases do
    [
      espec: ["ecto.create --quiet", "ecto.migrate", "espec"]
    ]
  end
end
