defmodule MailveProject.Emails.Email do
  use Ecto.Schema
  import Ecto.Changeset

  alias MailveProject.Emails.ListOfEmails

  schema "email" do
    field :body, :string
    field :subject, :string

    has_one :list_of_emails,  ListOfEmails

    timestamps()
  end

  @doc false
  def changeset(email, attrs) do
    email
    |> cast(attrs, [:subject, :body])
    |> validate_required([:subject, :body])
  end
end
