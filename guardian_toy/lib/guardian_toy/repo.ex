defmodule GuardianToy.Repo do
  use Ecto.Repo,
    otp_app: :guardian_toy,
    adapter: Ecto.Adapters.Postgres
end
