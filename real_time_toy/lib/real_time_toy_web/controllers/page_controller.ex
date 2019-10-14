defmodule RealTimeToyWeb.PageController do
  use RealTimeToyWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
