defmodule PhoenixContexts.IdentityTest do
  use PhoenixContexts.DataCase

  alias PhoenixContexts.Identity

  describe "users" do
    alias PhoenixContexts.Identity.User

    @valid_attrs %{email: "some email", name: "some name"}
    @update_attrs %{email: "some updated email", name: "some updated name"}
    @invalid_attrs %{email: nil, name: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Identity.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Identity.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Identity.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Identity.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.name == "some name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Identity.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Identity.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.email == "some updated email"
      assert user.name == "some updated name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Identity.update_user(user, @invalid_attrs)
      assert user == Identity.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Identity.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Identity.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Identity.change_user(user)
    end
  end

  describe "cars" do
    alias PhoenixContexts.Identity.Car

    @valid_attrs %{model: "some model"}
    @update_attrs %{model: "some updated model"}
    @invalid_attrs %{model: nil}

    def car_fixture(attrs \\ %{}) do
      {:ok, car} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Identity.create_car()

      car
    end

    test "list_cars/0 returns all cars" do
      car = car_fixture()
      assert Identity.list_cars() == [car]
    end

    test "get_car!/1 returns the car with given id" do
      car = car_fixture()
      assert Identity.get_car!(car.id) == car
    end

    test "create_car/1 with valid data creates a car" do
      assert {:ok, %Car{} = car} = Identity.create_car(@valid_attrs)
      assert car.model == "some model"
    end

    test "create_car/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Identity.create_car(@invalid_attrs)
    end

    test "update_car/2 with valid data updates the car" do
      car = car_fixture()
      assert {:ok, car} = Identity.update_car(car, @update_attrs)
      assert %Car{} = car
      assert car.model == "some updated model"
    end

    test "update_car/2 with invalid data returns error changeset" do
      car = car_fixture()
      assert {:error, %Ecto.Changeset{}} = Identity.update_car(car, @invalid_attrs)
      assert car == Identity.get_car!(car.id)
    end

    test "delete_car/1 deletes the car" do
      car = car_fixture()
      assert {:ok, %Car{}} = Identity.delete_car(car)
      assert_raise Ecto.NoResultsError, fn -> Identity.get_car!(car.id) end
    end

    test "change_car/1 returns a car changeset" do
      car = car_fixture()
      assert %Ecto.Changeset{} = Identity.change_car(car)
    end
  end
end
