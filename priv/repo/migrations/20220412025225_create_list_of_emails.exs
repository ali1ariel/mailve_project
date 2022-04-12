defmodule MailveProject.Repo.Migrations.CreateListOfEmails do
  use Ecto.Migration

  def change do
    create table(:list_of_emails) do
      add :email_id, references(:email, on_delete: :nothing)

      timestamps()
    end

    create index(:list_of_emails, [:email_id])
  end
end
