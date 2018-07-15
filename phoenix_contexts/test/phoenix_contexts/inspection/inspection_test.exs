defmodule PhoenixContexts.InspectionTest do
  use PhoenixContexts.DataCase

  alias PhoenixContexts.Inspection

  describe "mechanics" do
    alias PhoenixContexts.Inspection.Mechanic

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def mechanic_fixture(attrs \\ %{}) do
      {:ok, mechanic} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Inspection.create_mechanic()

      mechanic
    end

    test "list_mechanics/0 returns all mechanics" do
      mechanic = mechanic_fixture()
      assert Inspection.list_mechanics() == [mechanic]
    end

    test "get_mechanic!/1 returns the mechanic with given id" do
      mechanic = mechanic_fixture()
      assert Inspection.get_mechanic!(mechanic.id) == mechanic
    end

    test "create_mechanic/1 with valid data creates a mechanic" do
      assert {:ok, %Mechanic{} = mechanic} = Inspection.create_mechanic(@valid_attrs)
    end

    test "create_mechanic/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inspection.create_mechanic(@invalid_attrs)
    end

    test "update_mechanic/2 with valid data updates the mechanic" do
      mechanic = mechanic_fixture()
      assert {:ok, mechanic} = Inspection.update_mechanic(mechanic, @update_attrs)
      assert %Mechanic{} = mechanic
    end

    test "update_mechanic/2 with invalid data returns error changeset" do
      mechanic = mechanic_fixture()
      assert {:error, %Ecto.Changeset{}} = Inspection.update_mechanic(mechanic, @invalid_attrs)
      assert mechanic == Inspection.get_mechanic!(mechanic.id)
    end

    test "delete_mechanic/1 deletes the mechanic" do
      mechanic = mechanic_fixture()
      assert {:ok, %Mechanic{}} = Inspection.delete_mechanic(mechanic)
      assert_raise Ecto.NoResultsError, fn -> Inspection.get_mechanic!(mechanic.id) end
    end

    test "change_mechanic/1 returns a mechanic changeset" do
      mechanic = mechanic_fixture()
      assert %Ecto.Changeset{} = Inspection.change_mechanic(mechanic)
    end
  end

  describe "owners" do
    alias PhoenixContexts.Inspection.Owner

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def owner_fixture(attrs \\ %{}) do
      {:ok, owner} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Inspection.create_owner()

      owner
    end

    test "list_owners/0 returns all owners" do
      owner = owner_fixture()
      assert Inspection.list_owners() == [owner]
    end

    test "get_owner!/1 returns the owner with given id" do
      owner = owner_fixture()
      assert Inspection.get_owner!(owner.id) == owner
    end

    test "create_owner/1 with valid data creates a owner" do
      assert {:ok, %Owner{} = owner} = Inspection.create_owner(@valid_attrs)
    end

    test "create_owner/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inspection.create_owner(@invalid_attrs)
    end

    test "update_owner/2 with valid data updates the owner" do
      owner = owner_fixture()
      assert {:ok, owner} = Inspection.update_owner(owner, @update_attrs)
      assert %Owner{} = owner
    end

    test "update_owner/2 with invalid data returns error changeset" do
      owner = owner_fixture()
      assert {:error, %Ecto.Changeset{}} = Inspection.update_owner(owner, @invalid_attrs)
      assert owner == Inspection.get_owner!(owner.id)
    end

    test "delete_owner/1 deletes the owner" do
      owner = owner_fixture()
      assert {:ok, %Owner{}} = Inspection.delete_owner(owner)
      assert_raise Ecto.NoResultsError, fn -> Inspection.get_owner!(owner.id) end
    end

    test "change_owner/1 returns a owner changeset" do
      owner = owner_fixture()
      assert %Ecto.Changeset{} = Inspection.change_owner(owner)
    end
  end
end
