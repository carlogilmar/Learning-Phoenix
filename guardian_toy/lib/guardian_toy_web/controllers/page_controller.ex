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
    IO.puts "******** user o {:error, :wrong_credencials}"
    IO.inspect params
    IO.puts "********"
    user = %{id: 1, username: "carlogilmar", password: "1234567890"}
    login_reply( {:ok, user}, conn )
    #conn |> redirect(to: "/")
  end
  def logout(conn, _) do
    conn
    |> GuardianToy.Guardian.Plug.sign_out()
    |> redirect(to: "/")
  end

  #def logout(conn, _) do
  #  conn
  #  |> Diagnosis.Guardian.Plug.sign_out()
  #  |> redirect(to: "/login")
  #end

  #defp login_reply({:error, _}, conn) do
  #  conn |> redirect(to: "/")
  #end

  defp login_reply({:ok, user}, conn) do
    user = GuardianToy.Guardian.encode_and_sign(user)
    IO.inspect user
    GuardianToy.Guardian.Plug.sign_in(conn, user) |> redirect(to: "/admin")
  end

end
