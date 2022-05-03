defmodule Project.Organization.Developer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "developers" do
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    belongs_to :expertise, Project.Organization.Expertise
    has_many :assignment, Project.Organization.Assignment

    timestamps()
  end

  @doc false
  def changeset(developer, attrs) do
    developer
    |> cast(attrs, [:first_name, :last_name, :email, :expertise_id])
    |> validate_required([:first_name, :last_name, :email])
  end
end
