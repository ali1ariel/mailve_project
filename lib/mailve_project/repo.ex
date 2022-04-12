defmodule MailveProject.Repo do
  use Ecto.Repo,
    otp_app: :mailve_project,
    adapter: Ecto.Adapters.Postgres
end
