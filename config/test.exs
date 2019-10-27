import Config

config :quote_persistence, Quote.Persistence.Repo,
  database: "quote_test",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
