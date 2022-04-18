defmodule Project.Organization.Assignment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "assignments" do
    field :due_date, :string
    field :name, :string
    belongs_to :status, Project.Organization.Status
    belongs_to :developer, Project.Organization.Developer
    belongs_to :task, Project.Organization.Task

    timestamps()
  end

  @doc false
  def changeset(assignment, attrs) do
    assignment
    |> cast(attrs, [:name, :due_date, :status_id, :developer_id, :task_id])
    |> validate_required([:name, :due_date])
  end
end
