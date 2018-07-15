defmodule PhoenixContextsWeb.OwnerControllerTest do
  use PhoenixContextsWeb.ConnCase

  alias PhoenixContexts.Inspection

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:owner) do
    {:ok, owner} = Inspection.create_owner(@create_attrs)
    owner
  end

  describe "index" do
    test "lists all owners", %{conn: conn} do
      conn = get conn, owner_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Owners"
    end
  end

  describe "new owner" do
    test "renders form", %{conn: conn} do
      conn = get conn, owner_path(conn, :new)
      assert html_response(conn, 200) =~ "New Owner"
    end
  end

  describe "create owner" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, owner_path(conn, :create), owner: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == owner_path(conn, :show, id)

      conn = get conn, owner_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Owner"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, owner_path(conn, :create), owner: @invalid_attrs
      assert html_response(conn, 200) =~ "New Owner"
    end
  end

  describe "edit owner" do
    setup [:create_owner]

    test "renders form for editing chosen owner", %{conn: conn, owner: owner} do
      conn = get conn, owner_path(conn, :edit, owner)
      assert html_response(conn, 200) =~ "Edit Owner"
    end
  end

  describe "update owner" do
    setup [:create_owner]

    test "redirects when data is valid", %{conn: conn, owner: owner} do
      conn = put conn, owner_path(conn, :update, owner), owner: @update_attrs
      assert redirected_to(conn) == owner_path(conn, :show, owner)

      conn = get conn, owner_path(conn, :show, owner)
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, owner: owner} do
      conn = put conn, owner_path(conn, :update, owner), owner: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Owner"
    end
  end

  describe "delete owner" do
    setup [:create_owner]

    test "deletes chosen owner", %{conn: conn, owner: owner} do
      conn = delete conn, owner_path(conn, :delete, owner)
      assert redirected_to(conn) == owner_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, owner_path(conn, :show, owner)
      end
    end
  end

  defp create_owner(_) do
    owner = fixture(:owner)
    {:ok, owner: owner}
  end
end
