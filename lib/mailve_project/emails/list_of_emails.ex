defmodule MailveProject.Emails.ListOfEmails do
  use Ecto.Schema
  import Ecto.Changeset

  alias MailveProject.Emails.Email
  alias MailveProject.Emails.EmailInfo

  schema "list_of_emails" do

    belongs_to :email, Email

    has_many :email_infos, EmailInfo

    timestamps()
  end

  @doc false
  def changeset(list_of_emails, attrs) do
    list_of_emails
    |> cast(attrs, [])
    |> validate_required([])
    |> cast_assoc(:email)
  end
end
