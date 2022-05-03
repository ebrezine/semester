defmodule Project.Organization.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :description, :string
    field :name, :string
    belongs_to :area, Project.Organization.Area
    has_many :assignment, Project.Organization.Assignment

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:name, :description, :area_id])
    |> validate_required([:name, :description])
  end
end
