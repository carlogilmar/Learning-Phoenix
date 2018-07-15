defmodule PhoenixContextsWeb.PageController do
  use PhoenixContextsWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
