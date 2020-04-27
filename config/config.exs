# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :powjwt,
  ecto_repos: [Powjwt.Repo]

# Configures the endpoint
config :powjwt, PowjwtWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8ZxsxXy6roDD8KWSgF1J+WbwKDKx4WMgWHcxp2u7bvsOGTOsPqnHEVCxddEcuO6v",
  render_errors: [view: PowjwtWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Powjwt.PubSub,
  live_view: [signing_salt: "dKcUKX/Z"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Pow Configuration
config :powjwt, :pow,
  user: Powjwt.Users.User,
  repo: Powjwt.Repo

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
