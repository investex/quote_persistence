defmodule Quote.InstrumentSpec do
  use ESpec

  import Quote.Persistence.Factory
  import Quote.Persistence.Matchers

  alias Quote.Persistence.Instrument
  alias Quote.Persistence.Repo

  describe "validations" do
    subject(build(:instrument))

    it "has a valid factory" do
      expect Instrument.changeset(subject()) |> Repo.insert |> to(be_ok())
    end

    it "is invalid without a symbol" do
      changeset = %{subject() | symbol: nil} |> Instrument.changeset
      expect changeset.valid? |> to(be_falsy())
    end

    it "is invalid without a currency" do
      changeset = %{subject() | currency: nil} |> Instrument.changeset
      expect changeset.valid? |> to(be_falsy())
    end

    it "is valid without a price" do
      changeset = %{subject() | price: nil} |> Instrument.changeset
      expect changeset.valid? |> to(be_truthy())
    end

    it "is invalid when a symbol already exists for the given currency" do
      subject = subject()
      insert(:instrument, symbol: subject.symbol, currency: subject.currency)
      expect Instrument.changeset(subject) |> Repo.insert |> to(be_error())
    end
  end
end
