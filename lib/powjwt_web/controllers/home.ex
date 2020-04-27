defmodule PowjwtWeb.Controllers.Home do
  use PowjwtWeb, :controller

  def home(conn, _params) do
    json(conn, %{logged_token: conn.private[:api_access_token], user_id: conn.private[:user_id]})
    conn
  end

end
