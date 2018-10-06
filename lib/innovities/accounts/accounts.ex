defmodule Innovities.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Innovities.Repo

  alias Innovities.Accounts.Innovator

  @doc """
  Returns the list of innovators.

  ## Examples

      iex> list_innovators()
      [%Innovator{}, ...]

  """
  def list_innovators do
    Repo.all(Innovator)
  end

  @doc """
  Gets a single innovator.

  Raises `Ecto.NoResultsError` if the Innovator does not exist.

  ## Examples

      iex> get_innovator!(123)
      %Innovator{}

      iex> get_innovator!(456)
      ** (Ecto.NoResultsError)

  """
  def get_innovator!(id), do: Repo.get!(Innovator, id)

  @doc """
  Creates a innovator.

  ## Examples

      iex> create_innovator(%{field: value})
      {:ok, %Innovator{}}

      iex> create_innovator(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_innovator(attrs \\ %{}) do
    %Innovator{}
    |> Innovator.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a innovator.

  ## Examples

      iex> update_innovator(innovator, %{field: new_value})
      {:ok, %Innovator{}}

      iex> update_innovator(innovator, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_innovator(%Innovator{} = innovator, attrs) do
    innovator
    |> Innovator.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Innovator.

  ## Examples

      iex> delete_innovator(innovator)
      {:ok, %Innovator{}}

      iex> delete_innovator(innovator)
      {:error, %Ecto.Changeset{}}

  """
  def delete_innovator(%Innovator{} = innovator) do
    Repo.delete(innovator)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking innovator changes.

  ## Examples

      iex> change_innovator(innovator)
      %Ecto.Changeset{source: %Innovator{}}

  """
  def change_innovator(%Innovator{} = innovator) do
    Innovator.changeset(innovator, %{})
  end

  alias Innovities.Accounts.Organization

  @doc """
  Returns the list of organizations.

  ## Examples

      iex> list_organizations()
      [%Organization{}, ...]

  """
  def list_organizations do
    Repo.all(Organization)
  end

  @doc """
  Gets a single organization.

  Raises `Ecto.NoResultsError` if the Organization does not exist.

  ## Examples

      iex> get_organization!(123)
      %Organization{}

      iex> get_organization!(456)
      ** (Ecto.NoResultsError)

  """
  def get_organization!(id), do: Repo.get!(Organization, id)

  @doc """
  Creates a organization.

  ## Examples

      iex> create_organization(%{field: value})
      {:ok, %Organization{}}

      iex> create_organization(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_organization(attrs \\ %{}) do
    %Organization{}
    |> Organization.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a organization.

  ## Examples

      iex> update_organization(organization, %{field: new_value})
      {:ok, %Organization{}}

      iex> update_organization(organization, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_organization(%Organization{} = organization, attrs) do
    organization
    |> Organization.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Organization.

  ## Examples

      iex> delete_organization(organization)
      {:ok, %Organization{}}

      iex> delete_organization(organization)
      {:error, %Ecto.Changeset{}}

  """
  def delete_organization(%Organization{} = organization) do
    Repo.delete(organization)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking organization changes.

  ## Examples

      iex> change_organization(organization)
      %Ecto.Changeset{source: %Organization{}}

  """
  def change_organization(%Organization{} = organization) do
    Organization.changeset(organization, %{})
  end
end
