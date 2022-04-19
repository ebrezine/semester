defmodule ProjectWeb.AssignmentController do
  use ProjectWeb, :controller

  alias Project.Organization
  alias Project.Organization.Assignment
  alias Project.Repo

  def index(conn, _params) do
    assignments = Organization.list_assignments() |> Repo.preload(:status) |> Repo.preload(:developer) |> Repo.preload(:task)# |> Repo.preload(:expertise) |> Repo.preload(:area)
    render(conn, "index.html", assignments: assignments)
  end

  def new(conn, _params) do
    changeset = Organization.change_assignment(%Assignment{})
    statuses = Organization.list_statuses()
    developers = Organization.list_developers()
    tasks = Organization.list_tasks()
    render(conn, "new.html", changeset: changeset, statuses: statuses, developers: developers, tasks: tasks)
  end

  def create(conn, %{"assignment" => assignment_params}) do
    case Organization.create_assignment(assignment_params) do
      {:ok, assignment} ->
        conn
        |> put_flash(:info, "Assignment created successfully.")
        |> redirect(to: Routes.assignment_path(conn, :show, assignment))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    assignment = Organization.get_assignment!(id) |> Repo.preload(:status) |> Repo.preload(:developer) |> Repo.preload(:task)# |> Repo.preload(:expertise) |> Repo.preload(:area)
    IO.inspect(assignment)
    developers = Organization.list_developers()
    tasks = Organization.list_tasks()
    render(conn, "show.html", assignment: assignment, developers: developers, tasks: tasks)
  end

  def edit(conn, %{"id" => id}) do
    assignment = Organization.get_assignment!(id) |> Repo.preload(:status) |> Repo.preload(:developer) |> Repo.preload(:task)# |> Repo.preload(:expertise) |> Repo.preload(:area)
    changeset = Organization.change_assignment(assignment)
    statuses = Organization.list_statuses()
    developers = Organization.list_developers()
    tasks = Organization.list_tasks()
    render(conn, "edit.html", assignment: assignment, changeset: changeset, statuses: statuses, developers: developers, tasks: tasks)
  end

  def update(conn, %{"id" => id, "assignment" => assignment_params}) do
    assignment = Organization.get_assignment!(id) |> Repo.preload(:status) |> Repo.preload(:developer) |> Repo.preload(:task)# |> Repo.preload(:expertise) |> Repo.preload(:area)

    case Organization.update_assignment(assignment, assignment_params) do
      {:ok, assignment} ->
        conn
        |> put_flash(:info, "Assignment updated successfully.")
        |> redirect(to: Routes.assignment_path(conn, :show, assignment))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", assignment: assignment, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    assignment = Organization.get_assignment!(id)
    {:ok, _assignment} = Organization.delete_assignment(assignment)

    conn
    |> put_flash(:info, "Assignment deleted successfully.")
    |> redirect(to: Routes.assignment_path(conn, :index))
  end
end
