defmodule Project.OrganizationTest do
  use Project.DataCase

  alias Project.Organization

  describe "areas" do
    alias Project.Organization.Area

    import Project.OrganizationFixtures

    @invalid_attrs %{name: nil}

    test "list_areas/0 returns all areas" do
      area = area_fixture()
      assert Organization.list_areas() == [area]
    end

    test "get_area!/1 returns the area with given id" do
      area = area_fixture()
      assert Organization.get_area!(area.id) == area
    end

    test "create_area/1 with valid data creates a area" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Area{} = area} = Organization.create_area(valid_attrs)
      assert area.name == "some name"
    end

    test "create_area/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Organization.create_area(@invalid_attrs)
    end

    test "update_area/2 with valid data updates the area" do
      area = area_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Area{} = area} = Organization.update_area(area, update_attrs)
      assert area.name == "some updated name"
    end

    test "update_area/2 with invalid data returns error changeset" do
      area = area_fixture()
      assert {:error, %Ecto.Changeset{}} = Organization.update_area(area, @invalid_attrs)
      assert area == Organization.get_area!(area.id)
    end

    test "delete_area/1 deletes the area" do
      area = area_fixture()
      assert {:ok, %Area{}} = Organization.delete_area(area)
      assert_raise Ecto.NoResultsError, fn -> Organization.get_area!(area.id) end
    end

    test "change_area/1 returns a area changeset" do
      area = area_fixture()
      assert %Ecto.Changeset{} = Organization.change_area(area)
    end
  end

  describe "tasks" do
    alias Project.Organization.Task

    import Project.OrganizationFixtures

    @invalid_attrs %{description: nil, name: nil}

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Organization.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Organization.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      valid_attrs = %{description: "some description", name: "some name"}

      assert {:ok, %Task{} = task} = Organization.create_task(valid_attrs)
      assert task.description == "some description"
      assert task.name == "some name"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Organization.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      update_attrs = %{description: "some updated description", name: "some updated name"}

      assert {:ok, %Task{} = task} = Organization.update_task(task, update_attrs)
      assert task.description == "some updated description"
      assert task.name == "some updated name"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Organization.update_task(task, @invalid_attrs)
      assert task == Organization.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Organization.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Organization.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Organization.change_task(task)
    end
  end

  describe "developers" do
    alias Project.Organization.Developer

    import Project.OrganizationFixtures

    @invalid_attrs %{email: nil, firstname: nil, lastname: nil}

    test "list_developers/0 returns all developers" do
      developer = developer_fixture()
      assert Organization.list_developers() == [developer]
    end

    test "get_developer!/1 returns the developer with given id" do
      developer = developer_fixture()
      assert Organization.get_developer!(developer.id) == developer
    end

    test "create_developer/1 with valid data creates a developer" do
      valid_attrs = %{email: "some email", firstname: "some firstname", lastname: "some lastname"}

      assert {:ok, %Developer{} = developer} = Organization.create_developer(valid_attrs)
      assert developer.email == "some email"
      assert developer.firstname == "some firstname"
      assert developer.lastname == "some lastname"
    end

    test "create_developer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Organization.create_developer(@invalid_attrs)
    end

    test "update_developer/2 with valid data updates the developer" do
      developer = developer_fixture()
      update_attrs = %{email: "some updated email", firstname: "some updated firstname", lastname: "some updated lastname"}

      assert {:ok, %Developer{} = developer} = Organization.update_developer(developer, update_attrs)
      assert developer.email == "some updated email"
      assert developer.firstname == "some updated firstname"
      assert developer.lastname == "some updated lastname"
    end

    test "update_developer/2 with invalid data returns error changeset" do
      developer = developer_fixture()
      assert {:error, %Ecto.Changeset{}} = Organization.update_developer(developer, @invalid_attrs)
      assert developer == Organization.get_developer!(developer.id)
    end

    test "delete_developer/1 deletes the developer" do
      developer = developer_fixture()
      assert {:ok, %Developer{}} = Organization.delete_developer(developer)
      assert_raise Ecto.NoResultsError, fn -> Organization.get_developer!(developer.id) end
    end

    test "change_developer/1 returns a developer changeset" do
      developer = developer_fixture()
      assert %Ecto.Changeset{} = Organization.change_developer(developer)
    end
  end
end
