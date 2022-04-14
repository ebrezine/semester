defmodule Project.Organization.Developer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "developers" do
    field :email, :string
    field :firstname, :string
    field :lastname, :string
    field :expertise, :id

    timestamps()
  end

  @doc false
  def changeset(developer, attrs) do
    developer
    |> cast(attrs, [:firstname, :lastname, :email])
    |> validate_required([:firstname, :lastname, :email])
  end
end
