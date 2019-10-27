defmodule Quote.Persistence.RepoCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias Quote.Persistence.Repo

      import Ecto
      import Ecto.Query
      import Quote.Persistence.RepoCase

      # and any other stuff
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Quote.Persistence.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Quote.Persistence.Repo, {:shared, self()})
    end

    :ok
  end
end
