defmodule MailveProject.Emails.EmailInfo do
  use Ecto.Schema
  import Ecto.Changeset

  alias MailveProject.Emails.ListOfEmails

  schema "email_infos" do
    field :full_info, :string
    field :successful, :boolean, default: nil
    field :target, :string
    field :send_at, :naive_datetime

    belongs_to :list_of_emails, ListOfEmails

    timestamps()
  end

  @doc false
  def changeset(email_info, attrs) do
    email_info
    |> cast(attrs, [:target, :full_info, :successful, :send_at])
    |> validate_required([:target, :full_info])
    |> put_assoc(:list_of_emails, attrs.list_of_emails)
  end
end
