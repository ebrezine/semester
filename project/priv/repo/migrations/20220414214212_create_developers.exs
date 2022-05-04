defmodule Project.Repo.Migrations.CreateDevelopers do
  use Ecto.Migration

  def change do
    create table(:developers) do
      add :first_name, :string
      add :last_name, :string
      add :email, :string
      add :zip, :integer
      add :expertise_id, references(:areas, on_delete: :nothing)

      timestamps()
    end

    create index(:developers, [:expertise_id])
  end
end
