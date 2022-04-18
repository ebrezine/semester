defmodule Project.Organization do
  @moduledoc """
  The Organization context.
  """

  import Ecto.Query, warn: false
  alias Project.Repo

  alias Project.Organization.Area

  @doc """
  Returns the list of areas.

  ## Examples

      iex> list_areas()
      [%Area{}, ...]

  """
  def list_areas do
    Repo.all(Area)
  end

  @doc """
  Gets a single area.

  Raises `Ecto.NoResultsError` if the Area does not exist.

  ## Examples

      iex> get_area!(123)
      %Area{}

      iex> get_area!(456)
      ** (Ecto.NoResultsError)

  """
  def get_area!(id), do: Repo.get!(Area, id)

  @doc """
  Creates a area.

  ## Examples

      iex> create_area(%{field: value})
      {:ok, %Area{}}

      iex> create_area(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_area(attrs \\ %{}) do
    %Area{}
    |> Area.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a area.

  ## Examples

      iex> update_area(area, %{field: new_value})
      {:ok, %Area{}}

      iex> update_area(area, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_area(%Area{} = area, attrs) do
    area
    |> Area.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a area.

  ## Examples

      iex> delete_area(area)
      {:ok, %Area{}}

      iex> delete_area(area)
      {:error, %Ecto.Changeset{}}

  """
  def delete_area(%Area{} = area) do
    Repo.delete(area)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking area changes.

  ## Examples

      iex> change_area(area)
      %Ecto.Changeset{data: %Area{}}

  """
  def change_area(%Area{} = area, attrs \\ %{}) do
    Area.changeset(area, attrs)
  end

  alias Project.Organization.Task

  @doc """
  Returns the list of tasks.

  ## Examples

      iex> list_tasks()
      [%Task{}, ...]

  """
  def list_tasks do
    Repo.all(Task)
  end

  @doc """
  Gets a single task.

  Raises `Ecto.NoResultsError` if the Task does not exist.

  ## Examples

      iex> get_task!(123)
      %Task{}

      iex> get_task!(456)
      ** (Ecto.NoResultsError)

  """
  def get_task!(id), do: Repo.get!(Task, id)

  @doc """
  Creates a task.

  ## Examples

      iex> create_task(%{field: value})
      {:ok, %Task{}}

      iex> create_task(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_task(attrs \\ %{}) do
    %Task{}
    |> Task.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a task.

  ## Examples

      iex> update_task(task, %{field: new_value})
      {:ok, %Task{}}

      iex> update_task(task, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_task(%Task{} = task, attrs) do
    task
    |> Task.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a task.

  ## Examples

      iex> delete_task(task)
      {:ok, %Task{}}

      iex> delete_task(task)
      {:error, %Ecto.Changeset{}}

  """
  def delete_task(%Task{} = task) do
    Repo.delete(task)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking task changes.

  ## Examples

      iex> change_task(task)
      %Ecto.Changeset{data: %Task{}}

  """
  def change_task(%Task{} = task, attrs \\ %{}) do
    Task.changeset(task, attrs)
  end

  alias Project.Organization.Developer

  @doc """
  Returns the list of developers.

  ## Examples

      iex> list_developers()
      [%Developer{}, ...]

  """
  def list_developers do
    Repo.all(Developer)
  end

  @doc """
  Gets a single developer.

  Raises `Ecto.NoResultsError` if the Developer does not exist.

  ## Examples

      iex> get_developer!(123)
      %Developer{}

      iex> get_developer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_developer!(id), do: Repo.get!(Developer, id)

  @doc """
  Creates a developer.

  ## Examples

      iex> create_developer(%{field: value})
      {:ok, %Developer{}}

      iex> create_developer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_developer(attrs \\ %{}) do
    %Developer{}
    |> Developer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a developer.

  ## Examples

      iex> update_developer(developer, %{field: new_value})
      {:ok, %Developer{}}

      iex> update_developer(developer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_developer(%Developer{} = developer, attrs) do
    developer
    |> Developer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a developer.

  ## Examples

      iex> delete_developer(developer)
      {:ok, %Developer{}}

      iex> delete_developer(developer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_developer(%Developer{} = developer) do
    Repo.delete(developer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking developer changes.

  ## Examples

      iex> change_developer(developer)
      %Ecto.Changeset{data: %Developer{}}

  """
  def change_developer(%Developer{} = developer, attrs \\ %{}) do
    Developer.changeset(developer, attrs)
  end

  alias Project.Organization.Expertise

  @doc """
  Returns the list of expertises.

  ## Examples

      iex> list_expertises()
      [%Expertise{}, ...]

  """
  def list_expertises do
    Repo.all(Expertise)
  end

  @doc """
  Gets a single expertise.

  Raises `Ecto.NoResultsError` if the Expertise does not exist.

  ## Examples

      iex> get_expertise!(123)
      %Expertise{}

      iex> get_expertise!(456)
      ** (Ecto.NoResultsError)

  """
  def get_expertise!(id), do: Repo.get!(Expertise, id)

  @doc """
  Creates a expertise.

  ## Examples

      iex> create_expertise(%{field: value})
      {:ok, %Expertise{}}

      iex> create_expertise(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_expertise(attrs \\ %{}) do
    %Expertise{}
    |> Expertise.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a expertise.

  ## Examples

      iex> update_expertise(expertise, %{field: new_value})
      {:ok, %Expertise{}}

      iex> update_expertise(expertise, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_expertise(%Expertise{} = expertise, attrs) do
    expertise
    |> Expertise.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a expertise.

  ## Examples

      iex> delete_expertise(expertise)
      {:ok, %Expertise{}}

      iex> delete_expertise(expertise)
      {:error, %Ecto.Changeset{}}

  """
  def delete_expertise(%Expertise{} = expertise) do
    Repo.delete(expertise)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking expertise changes.

  ## Examples

      iex> change_expertise(expertise)
      %Ecto.Changeset{data: %Expertise{}}

  """
  def change_expertise(%Expertise{} = expertise, attrs \\ %{}) do
    Expertise.changeset(expertise, attrs)
  end

  alias Project.Organization.Status

  @doc """
  Returns the list of statuses.

  ## Examples

      iex> list_statuses()
      [%Status{}, ...]

  """
  def list_statuses do
    Repo.all(Status)
  end

  @doc """
  Gets a single status.

  Raises `Ecto.NoResultsError` if the Status does not exist.

  ## Examples

      iex> get_status!(123)
      %Status{}

      iex> get_status!(456)
      ** (Ecto.NoResultsError)

  """
  def get_status!(id), do: Repo.get!(Status, id)

  @doc """
  Creates a status.

  ## Examples

      iex> create_status(%{field: value})
      {:ok, %Status{}}

      iex> create_status(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_status(attrs \\ %{}) do
    %Status{}
    |> Status.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a status.

  ## Examples

      iex> update_status(status, %{field: new_value})
      {:ok, %Status{}}

      iex> update_status(status, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_status(%Status{} = status, attrs) do
    status
    |> Status.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a status.

  ## Examples

      iex> delete_status(status)
      {:ok, %Status{}}

      iex> delete_status(status)
      {:error, %Ecto.Changeset{}}

  """
  def delete_status(%Status{} = status) do
    Repo.delete(status)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking status changes.

  ## Examples

      iex> change_status(status)
      %Ecto.Changeset{data: %Status{}}

  """
  def change_status(%Status{} = status, attrs \\ %{}) do
    Status.changeset(status, attrs)
  end

  alias Project.Organization.Assignment

  @doc """
  Returns the list of assignments.

  ## Examples

      iex> list_assignments()
      [%Assignment{}, ...]

  """
  def list_assignments do
    Repo.all(Assignment)
  end

  @doc """
  Gets a single assignment.

  Raises `Ecto.NoResultsError` if the Assignment does not exist.

  ## Examples

      iex> get_assignment!(123)
      %Assignment{}

      iex> get_assignment!(456)
      ** (Ecto.NoResultsError)

  """
  def get_assignment!(id), do: Repo.get!(Assignment, id)

  @doc """
  Creates a assignment.

  ## Examples

      iex> create_assignment(%{field: value})
      {:ok, %Assignment{}}

      iex> create_assignment(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_assignment(attrs \\ %{}) do
    %Assignment{}
    |> Assignment.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a assignment.

  ## Examples

      iex> update_assignment(assignment, %{field: new_value})
      {:ok, %Assignment{}}

      iex> update_assignment(assignment, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_assignment(%Assignment{} = assignment, attrs) do
    assignment
    |> Assignment.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a assignment.

  ## Examples

      iex> delete_assignment(assignment)
      {:ok, %Assignment{}}

      iex> delete_assignment(assignment)
      {:error, %Ecto.Changeset{}}

  """
  def delete_assignment(%Assignment{} = assignment) do
    Repo.delete(assignment)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking assignment changes.

  ## Examples

      iex> change_assignment(assignment)
      %Ecto.Changeset{data: %Assignment{}}

  """
  def change_assignment(%Assignment{} = assignment, attrs \\ %{}) do
    Assignment.changeset(assignment, attrs)
  end
end
