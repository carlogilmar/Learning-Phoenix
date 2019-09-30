# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :guardian_toy,
  ecto_repos: [GuardianToy.Repo]

# Configures the endpoint
config :guardian_toy, GuardianToyWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "AG/D2BjHYdjTz3Zy8I+wIdySXxtYEtzGA/CFxFLNS0ifkaZmUrO+qeXPIqzayVZR",
  render_errors: [view: GuardianToyWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: GuardianToy.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Guardian config
config :guardian_toy, MyApp.Guardian,
issuer: "guardian_toy",
secret_key: "x/o2cbC/Qc4vIAwnLFlpb7ykC2evv9Af8mWOL7IbeWHcGIUjnIKlLoqdRTXLoRSs"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
