defmodule GuardianToyWeb.PageController do
  use GuardianToyWeb, :controller

  def index(conn, params) do
    # This is the way for get the user in session
    #user = Diagnosis.Guardian.Plug.current_resource(conn)
		user = nil
    IO.inspect params
    conn |> render("index.html", maybe_user: user)
  end

  def home(conn, _params) do
    conn |> render("home.html")
  end

  def sign_in(conn, params) do
    #user = Accounts.sign_in_user_in_browser( params["username"], params["password"])
    #login_reply( user, conn )
    IO.inspect params
    conn |> redirect(to: "/")
  end

  #def logout(conn, _) do
  #  conn
  #  |> Diagnosis.Guardian.Plug.sign_out()
  #  |> redirect(to: "/login")
  #end

  #defp login_reply({:error, _}, conn) do
  #  conn |> redirect(to: "/")
  #end

  #defp login_reply({:ok, user}, conn) do
  #  Diagnosis.Guardian.Plug.sign_in(conn, user) |> redirect(to: "/login")
  #end

end
