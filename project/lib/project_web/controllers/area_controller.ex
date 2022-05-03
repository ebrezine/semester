defmodule ProjectWeb.AreaController do
  use ProjectWeb, :controller

  alias Project.Organization
  alias Project.Organization.Area
  alias Project.Repo

  def index(conn, _params) do
    areas = Organization.list_areas() |> Repo.preload(:task)
    render(conn, "index.html", areas: areas)
  end

  def new(conn, _params) do
    changeset = Organization.change_area(%Area{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"area" => area_params}) do
    case Organization.create_area(area_params) do
      {:ok, area} ->
        conn
        |> put_flash(:info, "Area created successfully.")
        |> redirect(to: Routes.area_path(conn, :show, area))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    area = Organization.get_area!(id)
    render(conn, "show.html", area: area)
  end

  def edit(conn, %{"id" => id}) do
    area = Organization.get_area!(id)
    changeset = Organization.change_area(area)
    render(conn, "edit.html", area: area, changeset: changeset)
  end

  def update(conn, %{"id" => id, "area" => area_params}) do
    area = Organization.get_area!(id)

    case Organization.update_area(area, area_params) do
      {:ok, area} ->
        conn
        |> put_flash(:info, "Area updated successfully.")
        |> redirect(to: Routes.area_path(conn, :show, area))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", area: area, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    area = Organization.get_area!(id)
    {:ok, _area} = Organization.delete_area(area)

    conn
    |> put_flash(:info, "Area deleted successfully.")
    |> redirect(to: Routes.area_path(conn, :index))
  end
end
