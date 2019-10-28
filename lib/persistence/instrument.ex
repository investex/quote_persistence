defmodule Quote.Persistence.Instrument do
  use Quote.Persistence.Schema

  import Ecto.Changeset

  @type t :: %__MODULE__{}

  schema "instruments" do
    field :global_id, :binary_id, read_after_writes: true
    field :symbol, :string
    field :currency, :string
    field :price, :integer

    timestamps()
  end

  def changeset(instrument, params \\ %{}) do
    instrument
    |> cast(params, [:symbol, :currency, :price])
    |> validate_required([:symbol, :currency])
    |> unique_constraint(:symbol, name: :instruments_symbol_currency_index)
  end
end
