defmodule Gencounter.ProducerConsumer do
    use GenStage

    require Integer

    def start_link do
        GenStage.start_link(__MODULE__, :state, name: __MODULE__)
    end

    def init(state) do
        {:producer_consumer, state, subscribe_to: [Gencounter.Producer]}
    end

    def handle_events(events, _from, state) do
        number = 
            events
            # enum filter will allow us to lazily apply a function to a list
            |> Enum.filter(&Integer.is_even/1)

        {:noreply, number, state}
    end
end