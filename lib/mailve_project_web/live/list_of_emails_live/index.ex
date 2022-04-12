defmodule MailveProjectWeb.ListOfEmailsLive.Index do
  use MailveProjectWeb, :live_view

  alias MailveProject.Emails
  alias MailveProject.Emails.ListOfEmails

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :list_of_emails_collection, list_list_of_emails())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit List of emails")
    |> assign(:list_of_emails, Emails.get_list_of_emails!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New List of emails")
    |> assign(:list_of_emails, %ListOfEmails{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing List of emails")
    |> assign(:list_of_emails, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    list_of_emails = Emails.get_list_of_emails!(id)
    {:ok, _} = Emails.delete_list_of_emails(list_of_emails)

    {:noreply, assign(socket, :list_of_emails_collection, list_list_of_emails())}
  end

  defp list_list_of_emails do

    Emails.list_list_of_emails()
    |> MailveProject.Repo.preload([:email, :email_infos])
  end
end
