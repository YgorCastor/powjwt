defmodule Powjwt.Auth.UserRegistration do
  defstruct [:email, :password, :password_confirmation]

  @type t() :: %__MODULE__{}
end
