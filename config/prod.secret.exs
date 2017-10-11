use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :geoip, GeoipWeb.Endpoint,
  secret_key_base: "6XVsgCwZRhSMR5jJs4QJ2ltbuPVAtwRoX8RPg9iqUmZYspp5KfB4v3Moa4ZOn3dZ"

# Configure your database
config :geoip, Geoip.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "geoip_prod",
  pool_size: 15
