defmodule PowjwtWeb.Router do
  use PowjwtWeb, :router
  use Pow.Phoenix.Router

  pipeline :api do
    plug :accepts, ["json"]
    plug Powjwt.Auth.AuthFlow, otp_app: :powjwt
  end

  pipeline :api_protected do
    plug Pow.Plug.RequireAuthenticated,
    error_handler: PowjwtWeb.AuthErrorHandler
  end

  scope "/api/auth", PowjwtWeb.Controllers do
    pipe_through :api

    post "/register", UserRegistration, :register
    post "/login", UserLogin, :login
  end

  scope "/api/home", PowjwtWeb.Controllers do
    pipe_through [:api, :api_protected]

    get "/profile", Home, :home
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: PowjwtWeb.Telemetry
    end
  end
end
