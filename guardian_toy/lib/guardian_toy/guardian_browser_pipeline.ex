defmodule GuardianToy.Guardian.BrowserPipeline do

  use Guardian.Plug.Pipeline,
      otp_app: :guardian_toy,
      module: GuardianToy.Guardian,
      error_handler: GuardianToy.Guardian.ErrorHandler

  plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}
  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
  plug Guardian.Plug.LoadResource, allow_blank: true

end
