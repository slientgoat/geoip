# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :geoip,
  ecto_repos: [Geoip.Repo]

# Configures the endpoint
config :geoip, GeoipWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "fYajXvE0ebc8aHmZJX9gjsQQJD5QdHXcufM03UsKFu6YzelT6gvF2ZvEQ0k1WEv4",
  render_errors: [view: GeoipWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Geoip.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
