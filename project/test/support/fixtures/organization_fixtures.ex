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
        firstname: "some firstname",
        lastname: "some lastname"
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
  Generate a developer.
  """
  def developer_fixture(attrs \\ %{}) do
    {:ok, developer} =
      attrs
      |> Enum.into(%{
        email: "some email",
        firstName: "some firstName",
        lastName: "some lastName"
      })
      |> Project.Organization.create_developer()

    developer
  end
end
