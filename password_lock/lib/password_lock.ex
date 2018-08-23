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

  # Server API

  def init(password) do
    # This function is triggered when you make a call to GenServer.start_link function
    {:ok, [password]}
  end

  # Server callbacks
  def handle_call({:unlock, password}, _from, passwords) do # ----> synchronous request
    if password in passwords do
      {:reply, :ok, passwords}

    else
      #write_to_logfile password
      {:reply, {:error,"wrongpassword"}, passwords}
    end
  end

  def handle_call({:reset, {old_password,new_password}}, _from, passwords) do
    if old_password in passwords do
      new_state = List.delete(passwords,old_password)
      {:reply, :ok, [new_password | new_state]}
    else
      #write_to_logfile new_password
      {:reply, {:error,"wrongpassword"}, passwords}

    end
  end

  # HANDLE_CALL
  # This is synchronous call which means you have wait after calling this till it returns the state.
  # HANDLE_CAST
  # This is asynchronous call which means you no need to wait for the result of the call, you can proceed with the next line of code execution unlike above one.

end
