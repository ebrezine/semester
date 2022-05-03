defmodule ProjectWeb.ExpertiseController do
  use ProjectWeb, :controller

  alias Project.Organization
  alias Project.Organization.Expertise
  alias Project.Repo

  def index(conn, _params) do
    expertises = Organization.list_expertises() |> Repo.preload(:developer)
    render(conn, "index.html", expertises: expertises)
  end

  def new(conn, _params) do
    changeset = Organization.change_expertise(%Expertise{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"expertise" => expertise_params}) do
    case Organization.create_expertise(expertise_params) do
      {:ok, expertise} ->
        conn
        |> put_flash(:info, "Expertise created successfully.")
        |> redirect(to: Routes.expertise_path(conn, :show, expertise))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    expertise = Organization.get_expertise!(id)
    render(conn, "show.html", expertise: expertise)
  end

  def edit(conn, %{"id" => id}) do
    expertise = Organization.get_expertise!(id)
    changeset = Organization.change_expertise(expertise)
    render(conn, "edit.html", expertise: expertise, changeset: changeset)
  end

  def update(conn, %{"id" => id, "expertise" => expertise_params}) do
    expertise = Organization.get_expertise!(id)

    case Organization.update_expertise(expertise, expertise_params) do
      {:ok, expertise} ->
        conn
        |> put_flash(:info, "Expertise updated successfully.")
        |> redirect(to: Routes.expertise_path(conn, :show, expertise))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", expertise: expertise, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    expertise = Organization.get_expertise!(id)
    {:ok, _expertise} = Organization.delete_expertise(expertise)

    conn
    |> put_flash(:info, "Expertise deleted successfully.")
    |> redirect(to: Routes.expertise_path(conn, :index))
  end
end
