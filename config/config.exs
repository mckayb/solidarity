# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :solidarity,
  ecto_repos: [Solidarity.Repo]

# Configures the endpoint
config :solidarity, SolidarityWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ALpaaNbd179jbgBD/g/kPTEMtEsKceMUF9hGLTinq6B/dC3B35e4R/H1NqKzhFoI",
  render_errors: [view: SolidarityWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Solidarity.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "D14S/MmmL2nDzh8mAbKwPh7zGi72X9Iz"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
