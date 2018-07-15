defmodule PhoenixContextsWeb.MechanicControllerTest do
  use PhoenixContextsWeb.ConnCase

  alias PhoenixContexts.Inspection

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:mechanic) do
    {:ok, mechanic} = Inspection.create_mechanic(@create_attrs)
    mechanic
  end

  tag :capture_log
  describe "index" do
    test "lists all mechanics", %{conn: conn} do
      conn = get conn, mechanic_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Mechanics"
    end
  end

  describe "new mechanic" do
    test "renders form", %{conn: conn} do
      conn = get conn, mechanic_path(conn, :new)
      assert html_response(conn, 200) =~ "New Mechanic"
    end
  end

  describe "create mechanic" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, mechanic_path(conn, :create), mechanic: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == mechanic_path(conn, :show, id)

      conn = get conn, mechanic_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Mechanic"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, mechanic_path(conn, :create), mechanic: @invalid_attrs
      assert html_response(conn, 200) =~ "New Mechanic"
    end
  end

  describe "edit mechanic" do
    setup [:create_mechanic]

    test "renders form for editing chosen mechanic", %{conn: conn, mechanic: mechanic} do
      conn = get conn, mechanic_path(conn, :edit, mechanic)
      assert html_response(conn, 200) =~ "Edit Mechanic"
    end
  end

  describe "update mechanic" do
    setup [:create_mechanic]

    test "redirects when data is valid", %{conn: conn, mechanic: mechanic} do
      conn = put conn, mechanic_path(conn, :update, mechanic), mechanic: @update_attrs
      assert redirected_to(conn) == mechanic_path(conn, :show, mechanic)

      conn = get conn, mechanic_path(conn, :show, mechanic)
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, mechanic: mechanic} do
      conn = put conn, mechanic_path(conn, :update, mechanic), mechanic: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Mechanic"
    end
  end

  describe "delete mechanic" do
    setup [:create_mechanic]

    test "deletes chosen mechanic", %{conn: conn, mechanic: mechanic} do
      conn = delete conn, mechanic_path(conn, :delete, mechanic)
      assert redirected_to(conn) == mechanic_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, mechanic_path(conn, :show, mechanic)
      end
    end
  end

  defp create_mechanic(_) do
    mechanic = fixture(:mechanic)
    {:ok, mechanic: mechanic}
  end
end
