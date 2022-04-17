defmodule ProjectWeb.ExpertiseControllerTest do
  use ProjectWeb.ConnCase

  import Project.OrganizationFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  describe "index" do
    test "lists all expertises", %{conn: conn} do
      conn = get(conn, Routes.expertise_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Expertises"
    end
  end

  describe "new expertise" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.expertise_path(conn, :new))
      assert html_response(conn, 200) =~ "New Expertise"
    end
  end

  describe "create expertise" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.expertise_path(conn, :create), expertise: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.expertise_path(conn, :show, id)

      conn = get(conn, Routes.expertise_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Expertise"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.expertise_path(conn, :create), expertise: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Expertise"
    end
  end

  describe "edit expertise" do
    setup [:create_expertise]

    test "renders form for editing chosen expertise", %{conn: conn, expertise: expertise} do
      conn = get(conn, Routes.expertise_path(conn, :edit, expertise))
      assert html_response(conn, 200) =~ "Edit Expertise"
    end
  end

  describe "update expertise" do
    setup [:create_expertise]

    test "redirects when data is valid", %{conn: conn, expertise: expertise} do
      conn = put(conn, Routes.expertise_path(conn, :update, expertise), expertise: @update_attrs)
      assert redirected_to(conn) == Routes.expertise_path(conn, :show, expertise)

      conn = get(conn, Routes.expertise_path(conn, :show, expertise))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, expertise: expertise} do
      conn = put(conn, Routes.expertise_path(conn, :update, expertise), expertise: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Expertise"
    end
  end

  describe "delete expertise" do
    setup [:create_expertise]

    test "deletes chosen expertise", %{conn: conn, expertise: expertise} do
      conn = delete(conn, Routes.expertise_path(conn, :delete, expertise))
      assert redirected_to(conn) == Routes.expertise_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.expertise_path(conn, :show, expertise))
      end
    end
  end

  defp create_expertise(_) do
    expertise = expertise_fixture()
    %{expertise: expertise}
  end
end
