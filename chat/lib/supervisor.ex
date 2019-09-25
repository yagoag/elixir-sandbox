defmodule Chat.Supervisor do
    # A supervisor will watch processes and handle situations such as trying to restart a process when it dies
    use Supervisor

    def start_link do
        Supervisor.start_link(__MODULE__, [])
    end

    def init(_) do
        children = [
            worker(Chat.Server, [])
        ]
        supervise(children, strategy: :one_for_one)
        # The one for one strategy means that each process does not affect its "siblings", so if a process dies
        # the other ones continue running and it only tries to restart the one that has died
        # :all_for_one -> will try to restart all processes it's overlooking
        # :rest_for_one -> will restart the process that died and the ones that were started after it
        # :simple_one_for_one -> more dynamic, allows us to define when to restart processes
    end
end