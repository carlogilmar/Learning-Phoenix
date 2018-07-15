defmodule MangoWeb.CategoryController do

  use MangoWeb, :controller
  alias Mango.Catalog

  def show(conn, _params) do
    products = Catalog.list_products
    conn
    |> assign(:products, products)
    |> assign(:name, "Title")
    |> render("show.html")
  end

end
