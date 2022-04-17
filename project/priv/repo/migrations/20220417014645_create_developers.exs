defmodule Project.Repo.Migrations.CreateDevelopers do
  use Ecto.Migration

  def change do
    create table(:developers) do
      add :firstName, :string
      add :lastName, :string
      add :email, :string
      add :expertise_id, references(:expertises, on_delete: :nothing)

      timestamps()
    end

    create index(:developers, [:expertise_id])
  end
end
