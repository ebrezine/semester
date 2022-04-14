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
end
