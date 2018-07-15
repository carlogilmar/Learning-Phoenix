defmodule MangoWeb.PageController do
  use MangoWeb, :controller
  alias Mango.Catalog

  def index(conn, _params) do
    seasonal_products = Catalog.list_seasonal_products
    #new_conn = assign( conn, :my_seasonal_products, seasonal_products)
    #render conn, "index.html", seasonal_products: seasonal_products
    conn
    |> assign(:seasonal_products, seasonal_products)
    |> render("index.html")
  end
end
