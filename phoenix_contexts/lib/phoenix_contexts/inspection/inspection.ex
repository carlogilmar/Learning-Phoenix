defmodule PhoenixContexts.Inspection do
  @moduledoc """
  The Inspection context.
  """

  import Ecto.Query, warn: false
  alias PhoenixContexts.Repo

  alias PhoenixContexts.Inspection.Mechanic

  @doc """
  Returns the list of mechanics.

  ## Examples

      iex> list_mechanics()
      [%Mechanic{}, ...]

  """
  def list_mechanics do
    Repo.all(Mechanic)
  end

  @doc """
  Gets a single mechanic.

  Raises `Ecto.NoResultsError` if the Mechanic does not exist.

  ## Examples

      iex> get_mechanic!(123)
      %Mechanic{}

      iex> get_mechanic!(456)
      ** (Ecto.NoResultsError)

  """
  def get_mechanic!(id), do: Repo.get!(Mechanic, id)

  @doc """
  Creates a mechanic.

  ## Examples

      iex> create_mechanic(%{field: value})
      {:ok, %Mechanic{}}

      iex> create_mechanic(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_mechanic(attrs \\ %{}) do
    %Mechanic{}
    |> Mechanic.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a mechanic.

  ## Examples

      iex> update_mechanic(mechanic, %{field: new_value})
      {:ok, %Mechanic{}}

      iex> update_mechanic(mechanic, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_mechanic(%Mechanic{} = mechanic, attrs) do
    mechanic
    |> Mechanic.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Mechanic.

  ## Examples

      iex> delete_mechanic(mechanic)
      {:ok, %Mechanic{}}

      iex> delete_mechanic(mechanic)
      {:error, %Ecto.Changeset{}}

  """
  def delete_mechanic(%Mechanic{} = mechanic) do
    Repo.delete(mechanic)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking mechanic changes.

  ## Examples

      iex> change_mechanic(mechanic)
      %Ecto.Changeset{source: %Mechanic{}}

  """
  def change_mechanic(%Mechanic{} = mechanic) do
    Mechanic.changeset(mechanic, %{})
  end

  alias PhoenixContexts.Inspection.Owner

  @doc """
  Returns the list of owners.

  ## Examples

      iex> list_owners()
      [%Owner{}, ...]

  """
  def list_owners do
    Repo.all(Owner)
  end

  @doc """
  Gets a single owner.

  Raises `Ecto.NoResultsError` if the Owner does not exist.

  ## Examples

      iex> get_owner!(123)
      %Owner{}

      iex> get_owner!(456)
      ** (Ecto.NoResultsError)

  """
  def get_owner!(id), do: Repo.get!(Owner, id)

  @doc """
  Creates a owner.

  ## Examples

      iex> create_owner(%{field: value})
      {:ok, %Owner{}}

      iex> create_owner(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_owner(attrs \\ %{}) do
    %Owner{}
    |> Owner.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a owner.

  ## Examples

      iex> update_owner(owner, %{field: new_value})
      {:ok, %Owner{}}

      iex> update_owner(owner, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_owner(%Owner{} = owner, attrs) do
    owner
    |> Owner.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Owner.

  ## Examples

      iex> delete_owner(owner)
      {:ok, %Owner{}}

      iex> delete_owner(owner)
      {:error, %Ecto.Changeset{}}

  """
  def delete_owner(%Owner{} = owner) do
    Repo.delete(owner)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking owner changes.

  ## Examples

      iex> change_owner(owner)
      %Ecto.Changeset{source: %Owner{}}

  """
  def change_owner(%Owner{} = owner) do
    Owner.changeset(owner, %{})
  end
end
