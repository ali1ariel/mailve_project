defmodule MailveProjectWeb.PageController do
  use MailveProjectWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
