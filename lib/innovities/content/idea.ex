defmodule Innovities.Content.Idea do
  use Ecto.Schema
  import Ecto.Changeset


  schema "ideas" do
    field :long_description, :string
    field :short_description, :string
    field :innovator_id, :id
    field :organization_id, :id

    timestamps()
  end

  @doc false
  def changeset(idea, attrs) do
    idea
    |> cast(attrs, [:innovator_id, :organization_id, :short_description, :long_description])
    |> validate_required([:innovator_id, :short_description])
  end
end
