import Config

config :quote_persistence, Quote.Persistence.Repo,
  database: "quote_dev",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :quote_persistence, ecto_repos: [Quote.Persistence.Repo]

import_config "#{Mix.env()}.exs"
