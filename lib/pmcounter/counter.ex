defmodule PMCounter.Counter do
  @moduledoc """
  The Counter context.
  """

  import Ecto.Query, warn: false
  alias PMCounter.Repo

  alias PMCounter.Counter.Installatio

  @doc """
  Returns the list of installations.

  ## Examples

      iex> list_installations()
      [%Installatio{}, ...]

  """
  def list_installations do
    Repo.all(Installatio)
  end

  @doc """
  Gets a single installatio.

  Raises `Ecto.NoResultsError` if the Installatio does not exist.

  ## Examples

      iex> get_installatio!(123)
      %Installatio{}

      iex> get_installatio!(456)
      ** (Ecto.NoResultsError)

  """
  def get_installatio!(id), do: Repo.get!(Installatio, id)

  @doc """
  Creates a installatio.

  ## Examples

      iex> create_installatio(%{field: value})
      {:ok, %Installatio{}}

      iex> create_installatio(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_installatio(attrs \\ %{}) do
    %Installatio{}
    |> Installatio.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a installatio.

  ## Examples

      iex> update_installatio(installatio, %{field: new_value})
      {:ok, %Installatio{}}

      iex> update_installatio(installatio, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_installatio(%Installatio{} = installatio, attrs) do
    installatio
    |> Installatio.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a installatio.

  ## Examples

      iex> delete_installatio(installatio)
      {:ok, %Installatio{}}

      iex> delete_installatio(installatio)
      {:error, %Ecto.Changeset{}}

  """
  def delete_installatio(%Installatio{} = installatio) do
    Repo.delete(installatio)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking installatio changes.

  ## Examples

      iex> change_installatio(installatio)
      %Ecto.Changeset{source: %Installatio{}}

  """
  def change_installatio(%Installatio{} = installatio) do
    Installatio.changeset(installatio, %{})
  end
end
