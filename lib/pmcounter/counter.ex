defmodule PMCounter.Counter do
  @moduledoc """
  The Counter context.
  """

  import Ecto.Query, warn: false
  alias PMCounter.Repo

  alias PMCounter.Counter.Installation

  @doc """
  Returns the list of installations.

  ## Examples

      iex> list_installations()
      0

  """
  def count_installations do
    from(
      i in Installation,
      group_by: i.version,
      select: {i.version, count(i.id)}
    )
    |> Repo.all()
    |> Enum.into(%{})

    # Repo.all(Installation)
  end

  # @doc """
  # Gets a single installation.

  # Raises `Ecto.NoResultsError` if the Installation does not exist.

  # ## Examples

  #     iex> get_installation!(123)
  #     %Installation{}

  #     iex> get_installation!(456)
  #     ** (Ecto.NoResultsError)

  # """
  # def get_installation!(id), do: Repo.get!(Installation, id)

  @doc """
  Creates a installation.

  ## Examples

      iex> create_installation(%{field: value})
      {:ok, %Installation{}}

      iex> create_installation(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_installation(attrs \\ %{}) do
    %Installation{}
    |> Installation.changeset(attrs)
    |> Repo.insert()
  end

  # @doc """
  # Updates a installation.

  # ## Examples

  #     iex> update_installation(installation, %{field: new_value})
  #     {:ok, %Installation{}}

  #     iex> update_installation(installation, %{field: bad_value})
  #     {:error, %Ecto.Changeset{}}

  # """
  # def update_installation(%Installation{} = installation, attrs) do
  #   installation
  #   |> Installation.changeset(attrs)
  #   |> Repo.update()
  # end

  # @doc """
  # Deletes a installation.

  # ## Examples

  #     iex> delete_installation(installation)
  #     {:ok, %Installation{}}

  #     iex> delete_installation(installation)
  #     {:error, %Ecto.Changeset{}}

  # """
  # def delete_installation(%Installation{} = installation) do
  #   Repo.delete(installation)
  # end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking installation changes.

  ## Examples

      iex> change_installation(installation)
      %Ecto.Changeset{source: %Installation{}}

  """
  def change_installation(%Installation{} = installation) do
    Installation.changeset(installation, %{})
  end
end
