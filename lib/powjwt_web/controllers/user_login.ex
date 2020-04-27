defmodule PowjwtWeb.Controllers.UserLogin do
  use PowjwtWeb, :controller

  alias Plug.Conn
  alias Powjwt.Auth.UserPassLogin

  @spec login(Conn.t(), UserPassLogin.t()) :: Conn.t()
  def login(conn, user_pass_login) do
    with {:ok, conn} <- conn |> Pow.Plug.authenticate_user(user_pass_login) do
      json(conn, %{token: conn.private[:api_access_token]})
    else
      {:error, conn} ->
        conn
        |> put_status(401)
        |> json(%{error: %{status: 401, message: "Invalid email or password"}})
    end
  end

end
