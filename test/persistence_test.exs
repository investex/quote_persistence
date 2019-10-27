defmodule Quote.PersistenceTest do
  use ExUnit.Case
  doctest Quote.Persistence

  test "greets the world" do
    assert Quote.Persistence.hello() == :world
  end
end
