defmodule Powjwt.Auth.UserPassLogin do
  defstruct [:email, :password]

  @type t() :: %__MODULE__{}
end
