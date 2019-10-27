defmodule Quote.Persistence.Matchers.BeOk do
  use ESpec.Assertions.Interface

  defp match(subject, _data) do
    case subject do
      {:ok, _} -> {true, subject}
      _ -> {false, subject}
    end
  end

  defp success_message(subject, _data, _result, positive) do
    to = if positive, do: "is", else: "is not"
    "`#{inspect subject}` #{to} an `ok` result."
  end

  defp error_message(subject, _data, _result, positive) do
    to = if positive, do: "to", else: "not to"
    "Expected `#{inspect subject}` #{to} be an `ok` result."
  end
end
