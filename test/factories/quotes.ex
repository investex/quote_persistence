defmodule Quote.Persistence.Factories.Quotes do
  defmacro __using__(_opts) do
    quote do
      def quote_factory do
        %Quote.Persistence.Quote{
          instrument_id: insert(:instrument).id,
          price: Faker.Random.Elixir.random_between(0, 1000),
          source: Faker.Nato.letter_code_word
        }
      end
    end
  end
end
