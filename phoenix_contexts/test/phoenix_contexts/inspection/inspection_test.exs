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
end
