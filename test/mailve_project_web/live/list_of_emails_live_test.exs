defmodule MailveProjectWeb.ListOfEmailsLiveTest do
  use MailveProjectWeb.ConnCase

  import Phoenix.LiveViewTest
  import MailveProject.EmailsFixtures

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  defp create_list_of_emails(_) do
    list_of_emails = list_of_emails_fixture()
    %{list_of_emails: list_of_emails}
  end

  describe "Index" do
    setup [:create_list_of_emails]

    test "lists all list_of_emails", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, Routes.list_of_emails_index_path(conn, :index))

      assert html =~ "Listing List of emails"
    end

    test "saves new list_of_emails", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.list_of_emails_index_path(conn, :index))

      assert index_live |> element("a", "New List of emails") |> render_click() =~
               "New List of emails"

      assert_patch(index_live, Routes.list_of_emails_index_path(conn, :new))

      assert index_live
             |> form("#list_of_emails-form", list_of_emails: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#list_of_emails-form", list_of_emails: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.list_of_emails_index_path(conn, :index))

      assert html =~ "List of emails created successfully"
    end

    test "updates list_of_emails in listing", %{conn: conn, list_of_emails: list_of_emails} do
      {:ok, index_live, _html} = live(conn, Routes.list_of_emails_index_path(conn, :index))

      assert index_live |> element("#list_of_emails-#{list_of_emails.id} a", "Edit") |> render_click() =~
               "Edit List of emails"

      assert_patch(index_live, Routes.list_of_emails_index_path(conn, :edit, list_of_emails))

      assert index_live
             |> form("#list_of_emails-form", list_of_emails: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#list_of_emails-form", list_of_emails: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.list_of_emails_index_path(conn, :index))

      assert html =~ "List of emails updated successfully"
    end

    test "deletes list_of_emails in listing", %{conn: conn, list_of_emails: list_of_emails} do
      {:ok, index_live, _html} = live(conn, Routes.list_of_emails_index_path(conn, :index))

      assert index_live |> element("#list_of_emails-#{list_of_emails.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#list_of_emails-#{list_of_emails.id}")
    end
  end

  describe "Show" do
    setup [:create_list_of_emails]

    test "displays list_of_emails", %{conn: conn, list_of_emails: list_of_emails} do
      {:ok, _show_live, html} = live(conn, Routes.list_of_emails_show_path(conn, :show, list_of_emails))

      assert html =~ "Show List of emails"
    end

    test "updates list_of_emails within modal", %{conn: conn, list_of_emails: list_of_emails} do
      {:ok, show_live, _html} = live(conn, Routes.list_of_emails_show_path(conn, :show, list_of_emails))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit List of emails"

      assert_patch(show_live, Routes.list_of_emails_show_path(conn, :edit, list_of_emails))

      assert show_live
             |> form("#list_of_emails-form", list_of_emails: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#list_of_emails-form", list_of_emails: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.list_of_emails_show_path(conn, :show, list_of_emails))

      assert html =~ "List of emails updated successfully"
    end
  end
end
