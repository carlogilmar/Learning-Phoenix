defmodule PhoenixContextsWeb.MechanicController do
  use PhoenixContextsWeb, :controller

  alias PhoenixContexts.Inspection
  alias PhoenixContexts.Inspection.Mechanic

  def index(conn, _params) do
    mechanics = Inspection.list_mechanics()
    render(conn, "index.html", mechanics: mechanics)
  end

  def new(conn, _params) do
    changeset = Inspection.change_mechanic(%Mechanic{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"mechanic" => mechanic_params}) do
    case Inspection.create_mechanic(mechanic_params) do
      {:ok, mechanic} ->
        conn
        |> put_flash(:info, "Mechanic created successfully.")
        |> redirect(to: mechanic_path(conn, :show, mechanic))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    mechanic = Inspection.get_mechanic!(id)
    render(conn, "show.html", mechanic: mechanic)
  end

  def edit(conn, %{"id" => id}) do
    mechanic = Inspection.get_mechanic!(id)
    changeset = Inspection.change_mechanic(mechanic)
    render(conn, "edit.html", mechanic: mechanic, changeset: changeset)
  end

  def update(conn, %{"id" => id, "mechanic" => mechanic_params}) do
    mechanic = Inspection.get_mechanic!(id)

    case Inspection.update_mechanic(mechanic, mechanic_params) do
      {:ok, mechanic} ->
        conn
        |> put_flash(:info, "Mechanic updated successfully.")
        |> redirect(to: mechanic_path(conn, :show, mechanic))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", mechanic: mechanic, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    mechanic = Inspection.get_mechanic!(id)
    {:ok, _mechanic} = Inspection.delete_mechanic(mechanic)

    conn
    |> put_flash(:info, "Mechanic deleted successfully.")
    |> redirect(to: mechanic_path(conn, :index))
  end
end
