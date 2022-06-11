defmodule SitefinanceiroWeb.Despesa2LiveTest do
  use SitefinanceiroWeb.ConnCase

  import Phoenix.LiveViewTest
  import Sitefinanceiro.Timeline2Fixtures

  @create_attrs %{description: "some description", value: 120.5}
  @update_attrs %{description: "some updated description", value: 456.7}
  @invalid_attrs %{description: nil, value: nil}

  defp create_despesa2(_) do
    despesa2 = despesa2_fixture()
    %{despesa2: despesa2}
  end

  describe "Index" do
    setup [:create_despesa2]

    test "lists all despesas2", %{conn: conn, despesa2: despesa2} do
      {:ok, _index_live, html} = live(conn, Routes.despesa2_index_path(conn, :index))

      assert html =~ "Listing Despesas2"
      assert html =~ despesa2.description
    end

    test "saves new despesa2", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.despesa2_index_path(conn, :index))

      assert index_live |> element("a", "New Despesa2") |> render_click() =~
               "New Despesa2"

      assert_patch(index_live, Routes.despesa2_index_path(conn, :new))

      assert index_live
             |> form("#despesa2-form", despesa2: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#despesa2-form", despesa2: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.despesa2_index_path(conn, :index))

      assert html =~ "Despesa2 created successfully"
      assert html =~ "some description"
    end

    test "updates despesa2 in listing", %{conn: conn, despesa2: despesa2} do
      {:ok, index_live, _html} = live(conn, Routes.despesa2_index_path(conn, :index))

      assert index_live |> element("#despesa2-#{despesa2.id} a", "Edit") |> render_click() =~
               "Edit Despesa2"

      assert_patch(index_live, Routes.despesa2_index_path(conn, :edit, despesa2))

      assert index_live
             |> form("#despesa2-form", despesa2: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#despesa2-form", despesa2: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.despesa2_index_path(conn, :index))

      assert html =~ "Despesa2 updated successfully"
      assert html =~ "some updated description"
    end

    test "deletes despesa2 in listing", %{conn: conn, despesa2: despesa2} do
      {:ok, index_live, _html} = live(conn, Routes.despesa2_index_path(conn, :index))

      assert index_live |> element("#despesa2-#{despesa2.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#despesa2-#{despesa2.id}")
    end
  end

  describe "Show" do
    setup [:create_despesa2]

    test "displays despesa2", %{conn: conn, despesa2: despesa2} do
      {:ok, _show_live, html} = live(conn, Routes.despesa2_show_path(conn, :show, despesa2))

      assert html =~ "Show Despesa2"
      assert html =~ despesa2.description
    end

    test "updates despesa2 within modal", %{conn: conn, despesa2: despesa2} do
      {:ok, show_live, _html} = live(conn, Routes.despesa2_show_path(conn, :show, despesa2))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Despesa2"

      assert_patch(show_live, Routes.despesa2_show_path(conn, :edit, despesa2))

      assert show_live
             |> form("#despesa2-form", despesa2: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#despesa2-form", despesa2: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.despesa2_show_path(conn, :show, despesa2))

      assert html =~ "Despesa2 updated successfully"
      assert html =~ "some updated description"
    end
  end
end
