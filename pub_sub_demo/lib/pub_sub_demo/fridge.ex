defmodule PubSubDemo.Fridge do
  @pubsub_name :fridge
  @pubsub_topic "fridge_updates"

  def take(product, quantity) when is_binary(product) and is_integer(quantity) do
    Phoenix.PubSub.broadcast(@pubsub_name, @pubsub_topic, {:take, product, quantity})
  end

  def return(product, quantity) when is_binary(product) and is_integer(quantity) do
    Phoenix.PubSub.broadcast(@pubsub_name, @pubsub_topic, {:return, product, quantity})
  end
end
