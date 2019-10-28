defmodule Quote.Persistence.Quote do
  use Quote.Persistence.Schema

  import Ecto.Changeset

  alias Quote.Persistence.Instrument

  @type t :: %__MODULE__{}

  schema "quotes" do
    field :global_id, :binary_id, read_after_writes: true
    field :price, :integer, null: false
    field :source, :string, null: false
    field :response, :map, null: false

    belongs_to :instrument, Instrument

    timestamps()
  end

  def changeset(quote_obj, params \\ %{}) do
    quote_obj
    |> cast(params, [:price, :source, :response, :instrument_id])
    |> validate_required([:price, :source, :response, :instrument_id])
    |> assoc_constraint(:instrument)
  end
end
