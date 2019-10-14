defmodule GuardianToy.Guardian do

  use Guardian, otp_app: :guardian_toy

  def subject_for_token(user, _claims) do
    #{:ok, token, guardian} = user
    {:ok, 1}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    resource = %{username: "guardian toy papa"}
    {:ok,  resource}
  end
end

# Encript
# password = Argon2.hash_pwd_salt "carlo"
# Argon2.verify_pass "carlo", password
