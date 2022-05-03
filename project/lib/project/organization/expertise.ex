defmodule Project.Organization.Expertise do
  use Ecto.Schema
  import Ecto.Changeset

  schema "expertises" do
    field :name, :string
    has_many :developer, Project.Organization.Developer

    timestamps()
  end

  @doc false
  def changeset(expertise, attrs) do
    expertise
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
