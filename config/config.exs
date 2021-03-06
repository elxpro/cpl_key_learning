# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :key_learning,
  ecto_repos: [KeyLearning.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :key_learning, KeyLearningWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "BQKiYhWXR1H6EWRBHiwQsUG/8/4LZghVTp2r2d+qvAcexHSF7Lo/HUTK3+mS6gia",
  render_errors: [view: KeyLearningWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: KeyLearning.PubSub,
  live_view: [signing_salt: "dwYNn7e3"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :key_learning, KeyLearning.Guardian,
  issuer: "key_learning",
  secret_key: "WwlzWOtjhmSGtfTDLZXwD95cZKrIoSvY2S5G0ck16OmZ49njjdk+FKIxTMX+mqOX"

config :key_learning, KeyLearningWeb.AuthAccessPipelinePlug,
  module: KeyLearning.Guardian,
  error_handler: KeyLearningWeb.AuthErrorHandlerPlug

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
