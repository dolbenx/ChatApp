defmodule ChatApp.Security do
  @moduledoc """
  The Security context.
  """

  import Ecto.Query, warn: false
  alias ChatApp.Repo

  alias ChatApp.Security.Guns

  @doc """
  Returns the list of tbl_guns.

  ## Examples

      iex> list_tbl_guns()
      [%Guns{}, ...]

  """
  def list_tbl_guns do
    Repo.all(Guns)
  end

  @doc """
  Gets a single guns.

  Raises `Ecto.NoResultsError` if the Guns does not exist.

  ## Examples

      iex> get_guns!(123)
      %Guns{}

      iex> get_guns!(456)
      ** (Ecto.NoResultsError)

  """
  def get_guns!(id), do: Repo.get!(Guns, id)

  @doc """
  Creates a guns.

  ## Examples

      iex> create_guns(%{field: value})
      {:ok, %Guns{}}

      iex> create_guns(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_guns(attrs \\ %{}) do
    %Guns{}
    |> Guns.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a guns.

  ## Examples

      iex> update_guns(guns, %{field: new_value})
      {:ok, %Guns{}}

      iex> update_guns(guns, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_guns(%Guns{} = guns, attrs) do
    guns
    |> Guns.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a guns.

  ## Examples

      iex> delete_guns(guns)
      {:ok, %Guns{}}

      iex> delete_guns(guns)
      {:error, %Ecto.Changeset{}}

  """
  def delete_guns(%Guns{} = guns) do
    Repo.delete(guns)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking guns changes.

  ## Examples

      iex> change_guns(guns)
      %Ecto.Changeset{source: %Guns{}}

  """
  def change_guns(%Guns{} = guns) do
    Guns.changeset(guns, %{})
  end
end
