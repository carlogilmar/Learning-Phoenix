defmodule Uart do

  use GenServer

  #Client Api
  def start_link() do
    GenServer.start_link(__MODULE__, [])
  end

  def init_uart( pid ) do
    IO.puts "Client!"
    GenServer.call( pid, :init_uart )
  end

  #Server api
  def init(_) do
    IO.puts "GenServer here!!"
    {:ok, 1}
  end

  def handle_call( :init_uart, _, state ) do
    {:ok, uart} = Nerves.UART.start_link
    {:reply, uart, state}
  end

  # iex(1)> {:ok, pid} = Uart.start_link
  #GenServer here!!
  #{:ok, #PID<0.178.0>}
  #iex(2)> Uart.init_uart pid
  #Client!
  ##PID<0.180.0>

end
