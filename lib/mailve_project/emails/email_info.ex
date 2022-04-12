defmodule MailveProject.Emails.EmailInfo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "email_infos" do
    field :full_info, :string
    field :successful, :boolean, default: false
    field :target, :string

    timestamps()
  end

  @doc false
  def changeset(email_info, attrs) do
    email_info
    |> cast(attrs, [:target, :full_info, :successful])
    |> validate_required([:target, :full_info, :successful])
  end
end
