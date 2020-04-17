# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :toy, ToyWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "p0vQqKf0E/n8EcfsA1msSXxLBz3jT7bUlsi+yDTAOPgAjLADsUFy4Z0ig8ExWubP",
  render_errors: [view: ToyWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Toy.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "jxfK0FcN"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :toy, ToyWeb.Endpoint, live_view: [signing_salt: "hYAxMswyABx/ZBrS+Is0GB94QXeJlHYa"]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
