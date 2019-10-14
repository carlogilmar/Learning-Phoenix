defmodule PubSubDemo.Fridge do
  @pubsub_name :fridge
  @pubsub_topic "fridge_updates"

  def take(product, quantity) do
    IO.puts "Fridge in action! Take"
    Phoenix.PubSub.broadcast(@pubsub_name, @pubsub_topic, {:take, product, quantity})
  end

  def return(product, quantity) do
    IO.puts "Fridge in action! Return"
    Phoenix.PubSub.broadcast(@pubsub_name, @pubsub_topic, {:return, product, quantity})
  end
end
