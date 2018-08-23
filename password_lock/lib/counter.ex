defmodule Counter do
	use GenServer

  # Client Api
  def start_link() do
    # runs in the caller context 🐌Alice
    GenServer.start_link(__MODULE__, [])
  end

	def get_data(pid) do
		GenServer.call( pid, :get_data )
	end

  # Server Api
  def init(_) do
    # runs in the server context 🐨Bob
		IO.puts "Hello, I'm the gen server "
    {:ok, 1}
  end

  def handle_call(:get_data, _, state) do
    # runs in the server context 🐨Bob
    {:reply, state, state}
  end

  def handle_cast(:increment, state) do
    # runs in the server context 🐨Bob
    {:noreply, state+1}
  end

end
