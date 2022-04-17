defmodule Project.Repo.Migrations.CreateExpertises do
  use Ecto.Migration

  def change do
    create table(:expertises) do
      add :name, :string

      timestamps()
    end
  end
end
