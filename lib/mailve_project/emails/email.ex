defmodule MailveProject.Emails.Email do
  use Ecto.Schema
  import Ecto.Changeset

  schema "email" do
    field :body, :string
    field :subject, :string

    timestamps()
  end

  @doc false
  def changeset(email, attrs) do
    email
    |> cast(attrs, [:subject, :body])
    |> validate_required([:subject, :body])
  end
end
