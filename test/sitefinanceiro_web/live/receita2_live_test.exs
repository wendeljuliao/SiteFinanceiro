defmodule SitefinanceiroWeb.Receita2LiveTest do
  use SitefinanceiroWeb.ConnCase

  import Phoenix.LiveViewTest
  import Sitefinanceiro.TimelineFixtures

  @create_attrs %{description: "some description", value: 120.5}
  @update_attrs %{description: "some updated description", value: 456.7}
  @invalid_attrs %{description: nil, value: nil}

  defp create_receita2(_) do
    receita2 = receita2_fixture()
    %{receita2: receita2}
  end

  describe "Index" do
    setup [:create_receita2]

    test "lists all receitas2", %{conn: conn, receita2: receita2} do
      {:ok, _index_live, html} = live(conn, Routes.receita2_index_path(conn, :index))

      assert html =~ "Listing Receitas2"
      assert html =~ receita2.description
    end

    test "saves new receita2", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.receita2_index_path(conn, :index))

      assert index_live |> element("a", "New Receita2") |> render_click() =~
               "New Receita2"

      assert_patch(index_live, Routes.receita2_index_path(conn, :new))

      assert index_live
             |> form("#receita2-form", receita2: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#receita2-form", receita2: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.receita2_index_path(conn, :index))

      assert html =~ "Receita2 created successfully"
      assert html =~ "some description"
    end

    test "updates receita2 in listing", %{conn: conn, receita2: receita2} do
      {:ok, index_live, _html} = live(conn, Routes.receita2_index_path(conn, :index))

      assert index_live |> element("#receita2-#{receita2.id} a", "Edit") |> render_click() =~
               "Edit Receita2"

      assert_patch(index_live, Routes.receita2_index_path(conn, :edit, receita2))

      assert index_live
             |> form("#receita2-form", receita2: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#receita2-form", receita2: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.receita2_index_path(conn, :index))

      assert html =~ "Receita2 updated successfully"
      assert html =~ "some updated description"
    end

    test "deletes receita2 in listing", %{conn: conn, receita2: receita2} do
      {:ok, index_live, _html} = live(conn, Routes.receita2_index_path(conn, :index))

      assert index_live |> element("#receita2-#{receita2.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#receita2-#{receita2.id}")
    end
  end

  describe "Show" do
    setup [:create_receita2]

    test "displays receita2", %{conn: conn, receita2: receita2} do
      {:ok, _show_live, html} = live(conn, Routes.receita2_show_path(conn, :show, receita2))

      assert html =~ "Show Receita2"
      assert html =~ receita2.description
    end

    test "updates receita2 within modal", %{conn: conn, receita2: receita2} do
      {:ok, show_live, _html} = live(conn, Routes.receita2_show_path(conn, :show, receita2))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Receita2"

      assert_patch(show_live, Routes.receita2_show_path(conn, :edit, receita2))

      assert show_live
             |> form("#receita2-form", receita2: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#receita2-form", receita2: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.receita2_show_path(conn, :show, receita2))

      assert html =~ "Receita2 updated successfully"
      assert html =~ "some updated description"
    end
  end
end
