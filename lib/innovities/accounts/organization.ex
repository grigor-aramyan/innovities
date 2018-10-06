defmodule Innovities.Accounts.Organization do
  use Ecto.Schema
  import Ecto.Changeset

  alias Innovities.Content.Idea

  schema "organizations" do
    field :complete_ideas_count, :integer
    field :country, :string
    field :email, :string
    field :innovator_connection_count, :integer
    field :logo_uri, :string
    field :name, :string
    field :password, :string
    field :organizations_plan_id, :id

    has_many :ideas, Idea

    timestamps()
  end

  @doc false
  def changeset(organization, attrs) do
    organization
    |> cast(attrs, [:name, :email, :password, :country, :logo_uri, :complete_ideas_count, :innovator_connection_count, :organizations_plan_id])
    |> validate_required([:name, :email, :password, :country, :organizations_plan_id])
  end
end
