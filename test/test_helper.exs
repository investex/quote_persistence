{:ok, _} = Application.ensure_all_started(:ex_machina)
Ecto.Adapters.SQL.Sandbox.mode(Quote.Persistence.Repo, :manual)

ExUnit.start()
Faker.start()
