defmodule Project.Repo.Migrations.CreateDevelopers do
  use Ecto.Migration

  def change do
    create table(:developers) do
      add :firstname, :string
      add :lastname, :string
      add :email, :string
      add :expertise, references(:areas, on_delete: :nothing)

      timestamps()
    end

    create index(:developers, [:expertise])
  end
end
