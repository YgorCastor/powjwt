defmodule PowjwtWeb.Controllers.UserRegistration do
  use PowjwtWeb, :controller

  alias Ecto.Changeset
  alias Plug.Conn
  alias PowjwtWeb.ErrorHelpers
  alias Powjwt.Auth.UserRegistration

  @spec register(Conn.t(), UserRegistration.t()) :: Conn.t()
  def register(conn, user_registration_command) do
    with {:ok, _user, conn} <- conn |> Pow.Plug.create_user(user_registration_command) do
      json(conn, %{token: conn.private[:api_access_token]})
    else
      {:error, changeset, conn} ->
        errors = Changeset.traverse_errors(changeset, &ErrorHelpers.translate_error/1)
        conn
        |> put_status(500)
        |> json(%{error: %{status: 500, message: "Couldn't create user", errors: errors}})
    end
  end
end
