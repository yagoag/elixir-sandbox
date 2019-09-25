defmodule Chat.Server do
    use GenServer

    # Client Side
    def start_link do
        # Create a process with this module and its attributes
        GenServer.start_link(__MODULE__, [], name: :chat_room)
        # __MODULE__ = Chat.Server (current module's name)
        # If we want to be able to spawn multiple Chat instances,
        # we can remove name: :chat_room and make the modifications
        #explained in comments below to make chat instances associated
        # with their PID
    end

    # Will externalize the state of our process
    # Add pid as a parameter and change :chat_room to pid to enable
    # multiple concurrent chat rooms
    def get_msgs do
        GenServer.call(:chat_room, :get_msgs)
        # GenServer.call is often used for getting/setting state
        # It is synchronous (blocking), so we need to make sure the
        # called function calls back
    end

    # Add pid as a parameter and change :chat_room to pid to enable
    # multiple concurrent chat rooms
    def add_msg(msg) do
        GenServer.cast(:chat_room, {:add_msg, msg})
        # Asynchronous, we usually use it when we don't neet a response
    end

    # Server Side/Callback FUnctions
    def init(msgs) do
        {:ok, msgs}
    end

    def handle_call(:get_msgs, _from, msgs) do
        {:reply, msgs, msgs}
    end

    def handle_cast({:add_msg, msg}, msgs) do
        {:noreply, [msg | msgs]}
    end
end