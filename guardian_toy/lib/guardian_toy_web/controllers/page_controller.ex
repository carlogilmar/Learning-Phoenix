defmodule GuardianToyWeb.PageController do
  use GuardianToyWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
