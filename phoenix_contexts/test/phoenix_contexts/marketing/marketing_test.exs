defmodule PhoenixContexts.MarketingTest do
  use PhoenixContexts.DataCase

  alias PhoenixContexts.Marketing

  describe "visitors" do
    alias PhoenixContexts.Marketing.Visitor

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def visitor_fixture(attrs \\ %{}) do
      {:ok, visitor} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Marketing.create_visitor()

      visitor
    end

    test "list_visitors/0 returns all visitors" do
      visitor = visitor_fixture()
      assert Marketing.list_visitors() == [visitor]
    end

    test "get_visitor!/1 returns the visitor with given id" do
      visitor = visitor_fixture()
      assert Marketing.get_visitor!(visitor.id) == visitor
    end

    test "create_visitor/1 with valid data creates a visitor" do
      assert {:ok, %Visitor{} = visitor} = Marketing.create_visitor(@valid_attrs)
    end

    test "create_visitor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Marketing.create_visitor(@invalid_attrs)
    end

    test "update_visitor/2 with valid data updates the visitor" do
      visitor = visitor_fixture()
      assert {:ok, visitor} = Marketing.update_visitor(visitor, @update_attrs)
      assert %Visitor{} = visitor
    end

    test "update_visitor/2 with invalid data returns error changeset" do
      visitor = visitor_fixture()
      assert {:error, %Ecto.Changeset{}} = Marketing.update_visitor(visitor, @invalid_attrs)
      assert visitor == Marketing.get_visitor!(visitor.id)
    end

    test "delete_visitor/1 deletes the visitor" do
      visitor = visitor_fixture()
      assert {:ok, %Visitor{}} = Marketing.delete_visitor(visitor)
      assert_raise Ecto.NoResultsError, fn -> Marketing.get_visitor!(visitor.id) end
    end

    test "change_visitor/1 returns a visitor changeset" do
      visitor = visitor_fixture()
      assert %Ecto.Changeset{} = Marketing.change_visitor(visitor)
    end
  end
end
