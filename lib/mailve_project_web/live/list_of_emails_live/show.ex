defmodule MailveProjectWeb.ListOfEmailsLive.Show do
  use MailveProjectWeb, :live_view

  alias MailveProject.Emails

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:list_of_emails, Emails.get_list_of_emails!(id))}
  end

  defp page_title(:show), do: "Show List of emails"
  defp page_title(:edit), do: "Edit List of emails"
end
