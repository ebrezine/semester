defmodule Project.Organization.Status do
  use Ecto.Schema
  import Ecto.Changeset

  schema "statuses" do
    field :name, :string
    has_many :assignment, Project.Organization.Assignment

    timestamps()
  end

  @doc false
  def changeset(status, attrs) do
    status
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
