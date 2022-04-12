defmodule MailveProject.EmailsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MailveProject.Emails` context.
  """

  @doc """
  Generate a email_info.
  """
  def email_info_fixture(attrs \\ %{}) do
    {:ok, email_info} =
      attrs
      |> Enum.into(%{
        full_info: "some full_info",
        successful: true,
        target: "some target"
      })
      |> MailveProject.Emails.create_email_info()

    email_info
  end

  @doc """
  Generate a email.
  """
  def email_fixture(attrs \\ %{}) do
    {:ok, email} =
      attrs
      |> Enum.into(%{
        body: "some body",
        subject: "some subject"
      })
      |> MailveProject.Emails.create_email()

    email
  end
end
