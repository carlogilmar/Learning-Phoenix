defmodule PhoenixContexts.InpectionTest do
  use PhoenixContexts.DataCase

  alias PhoenixContexts.Inpection

  describe "owners" do
    alias PhoenixContexts.Inpection.Owner

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def owner_fixture(attrs \\ %{}) do
      {:ok, owner} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Inpection.create_owner()

      owner
    end

    test "list_owners/0 returns all owners" do
      owner = owner_fixture()
      assert Inpection.list_owners() == [owner]
    end

    test "get_owner!/1 returns the owner with given id" do
      owner = owner_fixture()
      assert Inpection.get_owner!(owner.id) == owner
    end

    test "create_owner/1 with valid data creates a owner" do
      assert {:ok, %Owner{} = owner} = Inpection.create_owner(@valid_attrs)
    end

    test "create_owner/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inpection.create_owner(@invalid_attrs)
    end

    test "update_owner/2 with valid data updates the owner" do
      owner = owner_fixture()
      assert {:ok, owner} = Inpection.update_owner(owner, @update_attrs)
      assert %Owner{} = owner
    end

    test "update_owner/2 with invalid data returns error changeset" do
      owner = owner_fixture()
      assert {:error, %Ecto.Changeset{}} = Inpection.update_owner(owner, @invalid_attrs)
      assert owner == Inpection.get_owner!(owner.id)
    end

    test "delete_owner/1 deletes the owner" do
      owner = owner_fixture()
      assert {:ok, %Owner{}} = Inpection.delete_owner(owner)
      assert_raise Ecto.NoResultsError, fn -> Inpection.get_owner!(owner.id) end
    end

    test "change_owner/1 returns a owner changeset" do
      owner = owner_fixture()
      assert %Ecto.Changeset{} = Inpection.change_owner(owner)
    end
  end
end
