# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :algorithm,
  ecto_repos: [Algorithm.Repo]

# Configures the endpoint
config :algorithm, AlgorithmWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Cssm7Z05lK4UxaJdU/b4iA3TeR4TfclfzaPc/P+a86CcEKTfMiLOfnVckM8N66xD",
  render_errors: [view: AlgorithmWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Algorithm.PubSub,
  live_view: [signing_salt: "fLIo3gXq"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
