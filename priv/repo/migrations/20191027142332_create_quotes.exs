defmodule Quote.Persistence.Repo.Migrations.CreateQuotes do
  use Ecto.Migration

  def up do
    create table(:quotes) do
      add :global_id, :uuid, null: false, default: fragment("uuid_generate_v4()")
      add :instrument_id, references(:instruments), null: false
      add :price, :integer, null: false
      add :source, :string, null: false
      add :response, :map, null: false

      timestamps()
    end

    alter table(:quotes) do
      modify(:inserted_at, :timestamp, default: fragment("NOW()"))
      modify(:updated_at, :timestamp, default: fragment("NOW()"))
    end

    create unique_index(:quotes, [:global_id])
    create index(:quotes, [:instrument_id])
  end

  def down do
    drop table(:quotes)
  end
end
