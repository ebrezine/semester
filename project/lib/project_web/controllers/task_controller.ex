defmodule ProjectWeb.TaskController do
  use ProjectWeb, :controller

  alias Project.Organization
  alias Project.Organization.Task
  alias Project.Repo

  def index(conn, _params) do
    tasks = Organization.list_tasks() |> Repo.preload(:area) |> Repo.preload(:assignment)
    render(conn, "index.html", tasks: tasks)
  end

  def new(conn, _params) do
    changeset = Organization.change_task(%Task{})
    areas = Organization.list_areas()
    render(conn, "new.html", changeset: changeset, areas: areas)
  end

  def create(conn, %{"task" => task_params}) do
    case Organization.create_task(task_params) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task created successfully.")
        |> redirect(to: Routes.task_path(conn, :show, task))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    task = Organization.get_task!(id) |> Repo.preload(:area)
    assignments = Organization.list_assignments() |> Repo.preload(:task) |> Repo.preload(:status) |> Repo.preload(:developer)
    areas = Organization.list_areas()
    render(conn, "show.html", task: task, assignments: assignments, areas: areas)
  end

  def edit(conn, %{"id" => id}) do
    task = Organization.get_task!(id) |> Repo.preload(:area)
    changeset = Organization.change_task(task)
    areas = Organization.list_areas()
    render(conn, "edit.html", task: task, changeset: changeset, areas: areas)
  end

  def update(conn, %{"id" => id, "task" => task_params}) do
    task = Organization.get_task!(id) |> Repo.preload(:area)

    case Organization.update_task(task, task_params) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task updated successfully.")
        |> redirect(to: Routes.task_path(conn, :show, task))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", task: task, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    task = Organization.get_task!(id)
    {:ok, _task} = Organization.delete_task(task)

    conn
    |> put_flash(:info, "Task deleted successfully.")
    |> redirect(to: Routes.task_path(conn, :index))
  end
end
