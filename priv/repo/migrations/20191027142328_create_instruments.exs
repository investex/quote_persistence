defmodule Quote.Persistence.Repo.Migrations.CreateInstruments do
  use Ecto.Migration

  def up do
    create table(:instruments) do
      add :global_id, :uuid, null: false, default: fragment("uuid_generate_v4()")
      add :symbol, :string, null: false
      add :currency, :string, null: false
      add :price, :integer

      timestamps()
    end

    alter table(:instruments) do
      modify(:inserted_at, :timestamp, default: fragment("NOW()"))
      modify(:updated_at, :timestamp, default: fragment("NOW()"))
    end

    create unique_index(:instruments, [:global_id])
    create unique_index(:instruments, [:symbol, :currency])
    create index(:instruments, [:symbol])
  end

  def down do
    drop table(:instruments)
  end
end
