defmodule PhoenixContexts.Identity do
  @moduledoc """
  The Identity context.
  """

  import Ecto.Query, warn: false
  alias PhoenixContexts.Repo

  alias PhoenixContexts.Identity.User

  def list_users do
    Repo.all(User)
  end

  def get_user!(id), do: Repo.get!(User, id)

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  alias PhoenixContexts.Identity.Car

  def list_cars do
    Repo.all(Car)
  end

  def get_car!(id), do: Repo.get!(Car, id)

  def create_car(attrs \\ %{}) do
    %Car{}
    |> Car.changeset(attrs)
    |> Repo.insert()
  end

  def update_car(%Car{} = car, attrs) do
    car
    |> Car.changeset(attrs)
    |> Repo.update()
  end

  def delete_car(%Car{} = car) do
    Repo.delete(car)
  end

  def change_car(%Car{} = car) do
    Car.changeset(car, %{})
  end
end
