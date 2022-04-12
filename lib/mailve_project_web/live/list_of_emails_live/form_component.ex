defmodule MailveProjectWeb.ListOfEmailsLive.FormComponent do
  use MailveProjectWeb, :live_component

  alias MailveProject.Emails

  @impl true
  def update(%{list_of_emails: list_of_emails} = assigns, socket) do
    changeset = Emails.change_list_of_emails(list_of_emails)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"list_of_emails" => list_of_emails_params}, socket) do
    changeset =
      socket.assigns.list_of_emails
      |> Emails.change_list_of_emails(list_of_emails_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"list_of_emails" => list_of_emails_params}, socket) do
    save_list_of_emails(socket, socket.assigns.action, list_of_emails_params)
  end

  defp save_list_of_emails(socket, :edit, list_of_emails_params) do
    case Emails.update_list_of_emails(socket.assigns.list_of_emails, list_of_emails_params) do
      {:ok, _list_of_emails} ->
        {:noreply,
         socket
         |> put_flash(:info, "List of emails updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_list_of_emails(socket, :new, list_of_emails_params) do
    case Emails.create_list_of_emails(list_of_emails_params) do
      {:ok, _list_of_emails} ->
        {:noreply,
         socket
         |> put_flash(:info, "List of emails created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
