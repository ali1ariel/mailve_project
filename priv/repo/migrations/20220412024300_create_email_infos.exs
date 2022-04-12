defmodule MailveProject.Repo.Migrations.CreateEmailInfos do
  use Ecto.Migration

  def change do
    create table(:email_infos) do
      add :target, :string
      add :full_info, :text
      add :successful, :boolean, null: true
      add :send_at, :naive_datetime

      timestamps()
    end
  end
end
