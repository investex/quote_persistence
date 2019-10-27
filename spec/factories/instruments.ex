defmodule Quote.Persistence.Factories.Instruments do
  defmacro __using__(_opts) do
    quote do
      def instrument_factory do
        %Quote.Persistence.Instrument{
          symbol: Faker.Finance.Stock.ticker,
          currency: "CAD",
          price: Faker.Random.Elixir.random_between(0, 1000)
        }
      end
    end
  end
end
