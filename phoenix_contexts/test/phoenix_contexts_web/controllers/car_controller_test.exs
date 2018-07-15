defmodule PhoenixContextsWeb.CarControllerTest do
  use PhoenixContextsWeb.ConnCase

  alias PhoenixContexts.Identity

  @create_attrs %{model: "some model"}
  @update_attrs %{model: "some updated model"}
  @invalid_attrs %{model: nil}

  def fixture(:car) do
    {:ok, car} = Identity.create_car(@create_attrs)
    car
  end

  describe "index" do
    test "lists all cars", %{conn: conn} do
      conn = get conn, car_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Cars"
    end
  end

  describe "new car" do
    test "renders form", %{conn: conn} do
      conn = get conn, car_path(conn, :new)
      assert html_response(conn, 200) =~ "New Car"
    end
  end

  describe "create car" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, car_path(conn, :create), car: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == car_path(conn, :show, id)

      conn = get conn, car_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Car"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, car_path(conn, :create), car: @invalid_attrs
      assert html_response(conn, 200) =~ "New Car"
    end
  end

  describe "edit car" do
    setup [:create_car]

    test "renders form for editing chosen car", %{conn: conn, car: car} do
      conn = get conn, car_path(conn, :edit, car)
      assert html_response(conn, 200) =~ "Edit Car"
    end
  end

  describe "update car" do
    setup [:create_car]

    test "redirects when data is valid", %{conn: conn, car: car} do
      conn = put conn, car_path(conn, :update, car), car: @update_attrs
      assert redirected_to(conn) == car_path(conn, :show, car)

      conn = get conn, car_path(conn, :show, car)
      assert html_response(conn, 200) =~ "some updated model"
    end

    test "renders errors when data is invalid", %{conn: conn, car: car} do
      conn = put conn, car_path(conn, :update, car), car: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Car"
    end
  end

  describe "delete car" do
    setup [:create_car]

    test "deletes chosen car", %{conn: conn, car: car} do
      conn = delete conn, car_path(conn, :delete, car)
      assert redirected_to(conn) == car_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, car_path(conn, :show, car)
      end
    end
  end

  defp create_car(_) do
    car = fixture(:car)
    {:ok, car: car}
  end
end
