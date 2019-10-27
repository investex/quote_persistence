defmodule Quote.QuoteSpec do
  use ESpec

  import Quote.Persistence.Factory
  import Quote.Persistence.Matchers

  alias Quote.Persistence.Repo
  alias Quote.Persistence.Quote

  describe "validations" do
    subject(build(:quote))

    it "has a valid factory" do
      expect Quote.changeset(subject()) |> Repo.insert |> to(be_ok())
    end

    it "is invalid without a price" do
      changeset = %{subject() | price: nil} |> Quote.changeset
      expect changeset.valid? |> to(be_falsy())
    end

    it "is invalid without a source" do
      changeset = %{subject() | source: nil} |> Quote.changeset
      expect changeset.valid? |> to(be_falsy())
    end

    it "is invalid without an instrument ID" do
      changeset = %{subject() | instrument_id: nil} |> Quote.changeset
      expect changeset.valid? |> to(be_falsy())
    end
  end
end
