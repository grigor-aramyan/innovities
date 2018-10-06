defmodule Innovities.Accounts.Innovator do
  use Ecto.Schema
  import Ecto.Changeset

  alias Innovities.Content.Idea

  schema "innovators" do
    field :country, :string
    field :email, :string
    field :full_name, :string
    field :generated_ideas_count, :integer
    field :organization_connection_count, :integer
    field :password, :string
    field :picture_uri, :string
    field :prefered_organization, :string
    field :innovators_plan_id, :id

    has_many :ideas, Idea

    timestamps()
  end

  @doc false
  def changeset(innovator, attrs) do
    innovator
    |> cast(attrs, [:full_name, :email, :password, :country, :picture_uri, :generated_ideas_count, :organization_connection_count, :prefered_organization, :innovators_plan_id])
    |> validate_required([:full_name, :email, :password, :innovators_plan_id])
    |> unique_constraint(:email)
    |> hash_user_password
  end

  defp hash_user_password(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, password: Bcrypt.hash_pwd_salt(password))
  end

  defp hash_user_password(changeset) do
    changeset
  end
end
