defmodule Quote.Persistence.Factory do
  use ExMachina.Ecto, repo: Quote.Persistence.Repo

  use Quote.Persistence.Factories.Instruments
  use Quote.Persistence.Factories.Quotes
end
