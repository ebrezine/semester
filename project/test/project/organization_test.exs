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
end
