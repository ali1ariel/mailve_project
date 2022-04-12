defmodule MailveProject.Repo.Migrations.CreateEmail do
  use Ecto.Migration

  def change do
    create table(:email) do
      add :subject, :string
      add :body, :text

      timestamps()
    end
  end
end
