defmodule Powjwt.Repo do
  use Ecto.Repo,
    otp_app: :powjwt,
    adapter: Ecto.Adapters.Postgres
end
