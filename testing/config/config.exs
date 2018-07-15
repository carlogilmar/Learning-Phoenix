# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :testing,
  ecto_repos: [Testing.Repo]

# Configures the endpoint
config :testing, TestingWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "IFbq1zNhKwx7qRhuR/gUdMmuzzQ4379K8W5jUYBsl1up9l+wAHDVRx9xu61iKW6z",
  render_errors: [view: TestingWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Testing.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
