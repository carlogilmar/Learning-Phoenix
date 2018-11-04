defmodule PhoenixWebpackWeb.PageController do
  use PhoenixWebpackWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
