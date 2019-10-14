defmodule GuardianToy.Guardian.ErrorHandler do
  @moduledoc false
  import Plug.Conn

  def auth_error(conn, {type, reason}, _opts) do
    #    body = Poison.encode!(%{message: to_string(type), type: "authentication", code: 401})
    send_resp(conn, 401, "Usuario No Logueado")
  end

end
