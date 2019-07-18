defmodule PubSubDemo.ShoppingList do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def get() do
    GenServer.call(__MODULE__, :get)
  end

  def init(_) do
    Phoenix.PubSub.subscribe(:fridge, "fridge_updates")
    {:ok, %{}}
  end

  def handle_call(:get, _, state) do
    {:reply, state, state}
  end

  def handle_info({:take, product, quantity}, state) do
    IO.puts("Adding #{product} (#{quantity}) to shopping list")

    updated_state = state
                    |> Map.update(product, quantity, &(&1 + quantity))

    {:noreply, updated_state}
  end

  def handle_info({:return, product, quantity}, state) do
    IO.puts("Removing #{product} (#{quantity}) from shopping list")

    updated_state = state
                    |> Map.update(product, 0, &(&1 - quantity))
                    |> Enum.reject(fn({_, v}) -> v <= 0 end)
                    |> Map.new

    {:noreply, updated_state}
  end
end
