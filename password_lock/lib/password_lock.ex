defmodule PasswordLock do

  use GenServer #GenServer is a behavior module that will force you to implement certain definitions inside your module

  # Client API

  # Starting...
  def statr_link( password ) do
    GenServer.start_link(__MODULE__, password, []) # This returns a pid for make request!
  end

  # Functions for gen server
  def unlock(server_pid, password) do
    # Call a gen server by server_pid
    GenServer.call(server_pid, {:unlock, password})
  end

  def reset(server_pid, {old_password,new_password}) do
    # Call a gen server by server_pid
    GenServer.call(server_pid, {:reset, {old_password,new_password}})
  end


end
