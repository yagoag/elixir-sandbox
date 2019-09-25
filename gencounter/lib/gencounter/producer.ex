defmodule Gencounter.Producer do
    use GenStage

    def start_link(init \\ 0) do # if init is not passed, will default to 0
        GenStage.start_link(__MODULE__, init, name: __MODULE__)
    end

    # Set state inside of GenStage, then call back and setup process
    def init(counter), do: {:producer, counter}

    def handle_demand(demand, state) do
        # Create a range and put it into a list in a lazy way:
        events = Enum.to_list(state..state + demand - 1)
        {:noreply, events, (state + demand)}
    end
end