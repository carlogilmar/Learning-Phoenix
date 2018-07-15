defmodule TestingWeb.PageController do
  use TestingWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
