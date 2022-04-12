defmodule MailveProject.EmailsTest do
  use MailveProject.DataCase

  alias MailveProject.Emails

  describe "email_infos" do
    alias MailveProject.Emails.EmailInfo

    import MailveProject.EmailsFixtures

    @invalid_attrs %{full_info: nil, successful: nil, target: nil}

    test "list_email_infos/0 returns all email_infos" do
      email_info = email_info_fixture()
      assert Emails.list_email_infos() == [email_info]
    end

    test "get_email_info!/1 returns the email_info with given id" do
      email_info = email_info_fixture()
      assert Emails.get_email_info!(email_info.id) == email_info
    end

    test "create_email_info/1 with valid data creates a email_info" do
      valid_attrs = %{full_info: "some full_info", successful: true, target: "some target"}

      assert {:ok, %EmailInfo{} = email_info} = Emails.create_email_info(valid_attrs)
      assert email_info.full_info == "some full_info"
      assert email_info.successful == true
      assert email_info.target == "some target"
    end

    test "create_email_info/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Emails.create_email_info(@invalid_attrs)
    end

    test "update_email_info/2 with valid data updates the email_info" do
      email_info = email_info_fixture()
      update_attrs = %{full_info: "some updated full_info", successful: false, target: "some updated target"}

      assert {:ok, %EmailInfo{} = email_info} = Emails.update_email_info(email_info, update_attrs)
      assert email_info.full_info == "some updated full_info"
      assert email_info.successful == false
      assert email_info.target == "some updated target"
    end

    test "update_email_info/2 with invalid data returns error changeset" do
      email_info = email_info_fixture()
      assert {:error, %Ecto.Changeset{}} = Emails.update_email_info(email_info, @invalid_attrs)
      assert email_info == Emails.get_email_info!(email_info.id)
    end

    test "delete_email_info/1 deletes the email_info" do
      email_info = email_info_fixture()
      assert {:ok, %EmailInfo{}} = Emails.delete_email_info(email_info)
      assert_raise Ecto.NoResultsError, fn -> Emails.get_email_info!(email_info.id) end
    end

    test "change_email_info/1 returns a email_info changeset" do
      email_info = email_info_fixture()
      assert %Ecto.Changeset{} = Emails.change_email_info(email_info)
    end
  end

  describe "email" do
    alias MailveProject.Emails.Email

    import MailveProject.EmailsFixtures

    @invalid_attrs %{body: nil, subject: nil}

    test "list_email/0 returns all email" do
      email = email_fixture()
      assert Emails.list_email() == [email]
    end

    test "get_email!/1 returns the email with given id" do
      email = email_fixture()
      assert Emails.get_email!(email.id) == email
    end

    test "create_email/1 with valid data creates a email" do
      valid_attrs = %{body: "some body", subject: "some subject"}

      assert {:ok, %Email{} = email} = Emails.create_email(valid_attrs)
      assert email.body == "some body"
      assert email.subject == "some subject"
    end

    test "create_email/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Emails.create_email(@invalid_attrs)
    end

    test "update_email/2 with valid data updates the email" do
      email = email_fixture()
      update_attrs = %{body: "some updated body", subject: "some updated subject"}

      assert {:ok, %Email{} = email} = Emails.update_email(email, update_attrs)
      assert email.body == "some updated body"
      assert email.subject == "some updated subject"
    end

    test "update_email/2 with invalid data returns error changeset" do
      email = email_fixture()
      assert {:error, %Ecto.Changeset{}} = Emails.update_email(email, @invalid_attrs)
      assert email == Emails.get_email!(email.id)
    end

    test "delete_email/1 deletes the email" do
      email = email_fixture()
      assert {:ok, %Email{}} = Emails.delete_email(email)
      assert_raise Ecto.NoResultsError, fn -> Emails.get_email!(email.id) end
    end

    test "change_email/1 returns a email changeset" do
      email = email_fixture()
      assert %Ecto.Changeset{} = Emails.change_email(email)
    end
  end
end
