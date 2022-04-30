defmodule Project.OrganizationFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Project.Organization` context.
  """

  @doc """
  Generate a area.
  """
  def area_fixture(attrs \\ %{}) do
    {:ok, area} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Project.Organization.create_area()

    area
  end

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> Project.Organization.create_task()

    task
  end

  @doc """
  Generate a developer.
  """
  def developer_fixture(attrs \\ %{}) do
    {:ok, developer} =
      attrs
      |> Enum.into(%{
        email: "some email",
        first_name: "some first_name",
        last_name: "some last_name"
      })
      |> Project.Organization.create_developer()

    developer
  end

  @doc """
  Generate a expertise.
  """
  def expertise_fixture(attrs \\ %{}) do
    {:ok, expertise} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Project.Organization.create_expertise()

    expertise
  end

  @doc """
  Generate a status.
  """
  def status_fixture(attrs \\ %{}) do
    {:ok, status} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Project.Organization.create_status()

    status
  end

  @doc """
  Generate a assignment.
  """
  def assignment_fixture(attrs \\ %{}) do
    {:ok, assignment} =
      attrs
      |> Enum.into(%{
        due_date: "some due_date",
        name: "some name"
      })
      |> Project.Organization.create_assignment()

    assignment
  end
end
