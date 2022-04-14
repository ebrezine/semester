defmodule ProjectWeb.DeveloperController do
  use ProjectWeb, :controller

  alias Project.Organization
  alias Project.Organization.Developer

  def index(conn, _params) do
    developers = Organization.list_developers()
    render(conn, "index.html", developers: developers)
  end

  def new(conn, _params) do
    changeset = Organization.change_developer(%Developer{})
    render(conn, "new.html", changeset: changeset)
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
    developer = Organization.get_developer!(id)
    render(conn, "show.html", developer: developer)
  end

  def edit(conn, %{"id" => id}) do
    developer = Organization.get_developer!(id)
    changeset = Organization.change_developer(developer)
    render(conn, "edit.html", developer: developer, changeset: changeset)
  end

  def update(conn, %{"id" => id, "developer" => developer_params}) do
    developer = Organization.get_developer!(id)

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
