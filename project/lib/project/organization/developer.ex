defmodule Project.Organization.Developer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "developers" do
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :zip, :integer
    belongs_to :expertise, Project.Organization.Expertise
    has_many :assignment, Project.Organization.Assignment

    timestamps()
  end
  #api key = fce66820-cb3c-11ec-9cfd-f54accd38b91



  @doc false
  def changeset(developer, attrs) do
    developer
    |> cast(attrs, [:first_name, :last_name, :email, :zip, :expertise_id])
    |> validate_required([:first_name, :last_name, :email, :zip])
  end
end
