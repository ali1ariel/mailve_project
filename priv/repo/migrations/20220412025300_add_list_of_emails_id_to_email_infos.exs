defmodule MailveProject.Repo.Migrations.AddListOfEmailsIdToEmailInfos do
  use Ecto.Migration

  def change do
    alter table(:email_infos) do
      add :list_of_emails_id, references(:list_of_emails, on_delete: :nothing)
    end

    create index(:email_infos, [:list_of_emails_id])
  end
end
