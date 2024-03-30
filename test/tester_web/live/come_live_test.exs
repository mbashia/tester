defmodule TesterWeb.ComeLiveTest do
  use TesterWeb.ConnCase

  import Phoenix.LiveViewTest
  import Tester.ComesFixtures

  @create_attrs %{description: "some description", text: "some text"}
  @update_attrs %{description: "some updated description", text: "some updated text"}
  @invalid_attrs %{description: nil, text: nil}

  defp create_come(_) do
    come = come_fixture()
    %{come: come}
  end

  describe "Index" do
    setup [:create_come]

    test "lists all come", %{conn: conn, come: come} do
      {:ok, _index_live, html} = live(conn, Routes.come_index_path(conn, :index))

      assert html =~ "Listing Come"
      assert html =~ come.description
    end

    test "saves new come", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.come_index_path(conn, :index))

      assert index_live |> element("a", "New Come") |> render_click() =~
               "New Come"

      assert_patch(index_live, Routes.come_index_path(conn, :new))

      assert index_live
             |> form("#come-form", come: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#come-form", come: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.come_index_path(conn, :index))

      assert html =~ "Come created successfully"
      assert html =~ "some description"
    end

    test "updates come in listing", %{conn: conn, come: come} do
      {:ok, index_live, _html} = live(conn, Routes.come_index_path(conn, :index))

      assert index_live |> element("#come-#{come.id} a", "Edit") |> render_click() =~
               "Edit Come"

      assert_patch(index_live, Routes.come_index_path(conn, :edit, come))

      assert index_live
             |> form("#come-form", come: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#come-form", come: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.come_index_path(conn, :index))

      assert html =~ "Come updated successfully"
      assert html =~ "some updated description"
    end

    test "deletes come in listing", %{conn: conn, come: come} do
      {:ok, index_live, _html} = live(conn, Routes.come_index_path(conn, :index))

      assert index_live |> element("#come-#{come.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#come-#{come.id}")
    end
  end

  describe "Show" do
    setup [:create_come]

    test "displays come", %{conn: conn, come: come} do
      {:ok, _show_live, html} = live(conn, Routes.come_show_path(conn, :show, come))

      assert html =~ "Show Come"
      assert html =~ come.description
    end

    test "updates come within modal", %{conn: conn, come: come} do
      {:ok, show_live, _html} = live(conn, Routes.come_show_path(conn, :show, come))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Come"

      assert_patch(show_live, Routes.come_show_path(conn, :edit, come))

      assert show_live
             |> form("#come-form", come: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#come-form", come: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.come_show_path(conn, :show, come))

      assert html =~ "Come updated successfully"
      assert html =~ "some updated description"
    end
  end
end
