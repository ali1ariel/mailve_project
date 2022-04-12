defmodule MailveProject.Emails do
  @moduledoc """
  The Emails context.
  """

  import Ecto.Query, warn: false
  alias MailveProject.Repo

  alias MailveProject.Emails.EmailInfo

  @doc """
  Returns the list of email_infos.

  ## Examples

      iex> list_email_infos()
      [%EmailInfo{}, ...]

  """
  def list_email_infos do
    Repo.all(EmailInfo)
  end

  @doc """
  Gets a single email_info.

  Raises `Ecto.NoResultsError` if the Email info does not exist.

  ## Examples

      iex> get_email_info!(123)
      %EmailInfo{}

      iex> get_email_info!(456)
      ** (Ecto.NoResultsError)

  """
  def get_email_info!(id), do: Repo.get!(EmailInfo, id)

  @doc """
  Creates a email_info.

  ## Examples

      iex> create_email_info(%{field: value})
      {:ok, %EmailInfo{}}

      iex> create_email_info(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_email_info(attrs \\ %{}) do
    %EmailInfo{}
    |> EmailInfo.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a email_info.

  ## Examples

      iex> update_email_info(email_info, %{field: new_value})
      {:ok, %EmailInfo{}}

      iex> update_email_info(email_info, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_email_info(%EmailInfo{} = email_info, attrs) do
    email_info
    |> EmailInfo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a email_info.

  ## Examples

      iex> delete_email_info(email_info)
      {:ok, %EmailInfo{}}

      iex> delete_email_info(email_info)
      {:error, %Ecto.Changeset{}}

  """
  def delete_email_info(%EmailInfo{} = email_info) do
    Repo.delete(email_info)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking email_info changes.

  ## Examples

      iex> change_email_info(email_info)
      %Ecto.Changeset{data: %EmailInfo{}}

  """
  def change_email_info(%EmailInfo{} = email_info, attrs \\ %{}) do
    EmailInfo.changeset(email_info, attrs)
  end

  alias MailveProject.Emails.Email

  @doc """
  Returns the list of email.

  ## Examples

      iex> list_email()
      [%Email{}, ...]

  """
  def list_email do
    Repo.all(Email)
  end

  @doc """
  Gets a single email.

  Raises `Ecto.NoResultsError` if the Email does not exist.

  ## Examples

      iex> get_email!(123)
      %Email{}

      iex> get_email!(456)
      ** (Ecto.NoResultsError)

  """
  def get_email!(id), do: Repo.get!(Email, id)

  @doc """
  Creates a email.

  ## Examples

      iex> create_email(%{field: value})
      {:ok, %Email{}}

      iex> create_email(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_email(attrs \\ %{}) do
    %Email{}
    |> Email.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a email.

  ## Examples

      iex> update_email(email, %{field: new_value})
      {:ok, %Email{}}

      iex> update_email(email, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_email(%Email{} = email, attrs) do
    email
    |> Email.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a email.

  ## Examples

      iex> delete_email(email)
      {:ok, %Email{}}

      iex> delete_email(email)
      {:error, %Ecto.Changeset{}}

  """
  def delete_email(%Email{} = email) do
    Repo.delete(email)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking email changes.

  ## Examples

      iex> change_email(email)
      %Ecto.Changeset{data: %Email{}}

  """
  def change_email(%Email{} = email, attrs \\ %{}) do
    Email.changeset(email, attrs)
  end

  alias MailveProject.Emails.ListOfEmails

  @doc """
  Returns the list of list_of_emails.

  ## Examples

      iex> list_list_of_emails()
      [%ListOfEmails{}, ...]

  """
  def list_list_of_emails do
    Repo.all(ListOfEmails)
  end

  @doc """
  Gets a single list_of_emails.

  Raises `Ecto.NoResultsError` if the List of emails does not exist.

  ## Examples

      iex> get_list_of_emails!(123)
      %ListOfEmails{}

      iex> get_list_of_emails!(456)
      ** (Ecto.NoResultsError)

  """
  def get_list_of_emails!(id), do: Repo.get!(ListOfEmails, id)

  @doc """
  Creates a list_of_emails.

  ## Examples

      iex> create_list_of_emails(%{field: value})
      {:ok, %ListOfEmails{}}

      iex> create_list_of_emails(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_list_of_emails(attrs \\ %{}) do
    %ListOfEmails{}
    |> ListOfEmails.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a list_of_emails.

  ## Examples

      iex> update_list_of_emails(list_of_emails, %{field: new_value})
      {:ok, %ListOfEmails{}}

      iex> update_list_of_emails(list_of_emails, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_list_of_emails(%ListOfEmails{} = list_of_emails, attrs) do
    list_of_emails
    |> ListOfEmails.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a list_of_emails.

  ## Examples

      iex> delete_list_of_emails(list_of_emails)
      {:ok, %ListOfEmails{}}

      iex> delete_list_of_emails(list_of_emails)
      {:error, %Ecto.Changeset{}}

  """
  def delete_list_of_emails(%ListOfEmails{} = list_of_emails) do
    Repo.delete(list_of_emails)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking list_of_emails changes.

  ## Examples

      iex> change_list_of_emails(list_of_emails)
      %Ecto.Changeset{data: %ListOfEmails{}}

  """
  def change_list_of_emails(%ListOfEmails{} = list_of_emails, attrs \\ %{}) do
    ListOfEmails.changeset(list_of_emails, attrs)
  end
end
