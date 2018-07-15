defmodule PhoenixContexts.Marketing do
  @moduledoc """
  The Marketing context.
  """

  import Ecto.Query, warn: false
  alias PhoenixContexts.Repo

  alias PhoenixContexts.Marketing.Visitor

  @doc """
  Returns the list of visitors.

  ## Examples

      iex> list_visitors()
      [%Visitor{}, ...]

  """
  def list_visitors do
    Repo.all(Visitor)
  end

  @doc """
  Gets a single visitor.

  Raises `Ecto.NoResultsError` if the Visitor does not exist.

  ## Examples

      iex> get_visitor!(123)
      %Visitor{}

      iex> get_visitor!(456)
      ** (Ecto.NoResultsError)

  """
  def get_visitor!(id), do: Repo.get!(Visitor, id)

  @doc """
  Creates a visitor.

  ## Examples

      iex> create_visitor(%{field: value})
      {:ok, %Visitor{}}

      iex> create_visitor(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_visitor(attrs \\ %{}) do
    %Visitor{}
    |> Visitor.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a visitor.

  ## Examples

      iex> update_visitor(visitor, %{field: new_value})
      {:ok, %Visitor{}}

      iex> update_visitor(visitor, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_visitor(%Visitor{} = visitor, attrs) do
    visitor
    |> Visitor.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Visitor.

  ## Examples

      iex> delete_visitor(visitor)
      {:ok, %Visitor{}}

      iex> delete_visitor(visitor)
      {:error, %Ecto.Changeset{}}

  """
  def delete_visitor(%Visitor{} = visitor) do
    Repo.delete(visitor)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking visitor changes.

  ## Examples

      iex> change_visitor(visitor)
      %Ecto.Changeset{source: %Visitor{}}

  """
  def change_visitor(%Visitor{} = visitor) do
    Visitor.changeset(visitor, %{})
  end
end
