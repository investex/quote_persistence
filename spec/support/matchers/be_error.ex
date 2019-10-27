defmodule Quote.Persistence.Matchers.BeError do
  use ESpec.Assertions.Interface

  defp match(subject, _data) do
    case subject do
      {:error, _} -> {true, subject}
      _ -> {false, subject}
    end
  end

  defp success_message(subject, _data, _result, positive) do
    to = if positive, do: "is", else: "is not"
    "`#{inspect subject}` #{to} an `error` result."
  end

  defp error_message(subject, _data, _result, positive) do
    to = if positive, do: "to", else: "not to"
    "Expected `#{inspect subject}` #{to} be an `error` result."
  end
end
