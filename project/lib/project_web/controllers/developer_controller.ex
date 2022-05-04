defmodule ProjectWeb.DeveloperController do
  use ProjectWeb, :controller

  alias Project.Organization
  alias Project.Organization.Developer
  alias Project.Repo

  def index(conn, _params) do
    developers = Organization.list_developers() |> Repo.preload(:expertise) |> Repo.preload(:assignment)
    IO.inspect(developers)
    render(conn, "index.html", developers: developers)
  end

  @spec new(Plug.Conn.t(), any) :: Plug.Conn.t()
  def new(conn, _params) do
    changeset = Organization.change_developer(%Developer{})
    expertises = Organization.list_expertises()
    render(conn, "new.html", changeset: changeset, expertises: expertises)
  end

  def create(conn, %{"developer" => developer_params}) do
    case Organization.create_developer(developer_params) do
      {:ok, developer} ->
        conn
        |> put_flash(:info, "Developer created successfully.")
        |> redirect(to: Routes.developer_path(conn, :show, developer))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    developer = Organization.get_developer!(id) |> Repo.preload(:expertise)
    assignments = Organization.list_assignments() |> Repo.preload(:task) |> Repo.preload(:status) |> Repo.preload(:developer)
    areas = Organization.list_areas()
    render(conn, "show.html", developer: developer, assignments: assignments, areas: areas)
  end

  def edit(conn, %{"id" => id}) do
    developer = Organization.get_developer!(id) |> Repo.preload(:expertise)
    changeset = Organization.change_developer(developer)
    expertises = Organization.list_expertises()
    render(conn, "edit.html", developer: developer, changeset: changeset, expertises: expertises)
  end

  def update(conn, %{"id" => id, "developer" => developer_params}) do
    developer = Organization.get_developer!(id) |> Repo.preload(:expertise)

    case Organization.update_developer(developer, developer_params) do
      {:ok, developer} ->
        conn
        |> put_flash(:info, "Developer updated successfully.")
        |> redirect(to: Routes.developer_path(conn, :show, developer))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", developer: developer, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    developer = Organization.get_developer!(id)
    {:ok, _developer} = Organization.delete_developer(developer)

    conn
    |> put_flash(:info, "Developer deleted successfully.")
    |> redirect(to: Routes.developer_path(conn, :index))
  end
end
