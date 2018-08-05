# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :tanto, Tanto.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "tanto_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :tanto, ecto_repos: [Tanto.Repo]
