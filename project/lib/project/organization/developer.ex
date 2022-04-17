defmodule Project.Organization.Developer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "developers" do
    field :email, :string
    field :firstName, :string
    field :lastName, :string
    belongs_to :expertise, Project.Organization.Expertise

    timestamps()
  end

  @doc false
  def changeset(developer, attrs) do
    developer
    |> cast(attrs, [:firstName, :lastName, :email, :expertise_id])
    |> validate_required([:firstName, :lastName, :email])
  end
end
