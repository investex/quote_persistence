defmodule Quote.Persistence.Matchers do
  alias Quote.Persistence.Matchers.BeOk
  alias Quote.Persistence.Matchers.BeError

  def be_ok(), do: {BeOk, nil}
  def be_error(), do: {BeError, nil}
end
