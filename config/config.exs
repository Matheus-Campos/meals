# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :meals,
  ecto_repos: [Meals.Repo]

# Configures the endpoint
config :meals, MealsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "1ZCZYh6ymH2dxP8eUZe5BJ8SRPxiwUu7Rh4ySw0iNkwUuoSDKP5aaF3MOMNVvawf",
  render_errors: [view: MealsWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Meals.PubSub,
  live_view: [signing_salt: "nZlZZGpy"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
