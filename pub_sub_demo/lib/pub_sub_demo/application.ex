defmodule PubSubDemo.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      %{
        id: Phoenix.PubSub.PG2,
        start: {Phoenix.PubSub.PG2, :start_link, [:fridge, []]}
      }
    ]

    opts = [strategy: :one_for_one, name: PubSubDemo.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
