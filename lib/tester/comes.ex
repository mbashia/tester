defmodule Tester.Comes do
  @moduledoc """
  The Comes context.
  """

  import Ecto.Query, warn: false
  alias Tester.Repo

  alias Tester.Comes.Come

  @doc """
  Returns the list of come.

  ## Examples

      iex> list_come()
      [%Come{}, ...]

  """
  def list_come do
    Repo.all(Come)
  end

  @doc """
  Gets a single come.

  Raises `Ecto.NoResultsError` if the Come does not exist.

  ## Examples

      iex> get_come!(123)
      %Come{}

      iex> get_come!(456)
      ** (Ecto.NoResultsError)

  """
  def get_come!(id), do: Repo.get!(Come, id)

  @doc """
  Creates a come.

  ## Examples

      iex> create_come(%{field: value})
      {:ok, %Come{}}

      iex> create_come(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_come(attrs \\ %{}) do
    %Come{}
    |> Come.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a come.

  ## Examples

      iex> update_come(come, %{field: new_value})
      {:ok, %Come{}}

      iex> update_come(come, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_come(%Come{} = come, attrs) do
    come
    |> Come.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a come.

  ## Examples

      iex> delete_come(come)
      {:ok, %Come{}}

      iex> delete_come(come)
      {:error, %Ecto.Changeset{}}

  """
  def delete_come(%Come{} = come) do
    Repo.delete(come)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking come changes.

  ## Examples

      iex> change_come(come)
      %Ecto.Changeset{data: %Come{}}

  """
  def change_come(%Come{} = come, attrs \\ %{}) do
    Come.changeset(come, attrs)
  end
end
