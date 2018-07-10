# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :fun_with_flags_bug_phx,
  ecto_repos: [FunWithFlagsBugPhx.Repo]

# FunWithFlags configuration
config :fun_with_flags, :persistence,
  adapter: FunWithFlags.Store.Persistent.Ecto,
  repo: FunWithFlagsBugPhx.Repo

# Configures the endpoint
config :fun_with_flags_bug_phx, FunWithFlagsBugPhxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "dKD2gaBM03yQIqRAJcYhN4ve2ynMcWac0eiOHOVED9k+EHLs4u7HbwylyvVhl8dE",
  render_errors: [view: FunWithFlagsBugPhxWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: FunWithFlagsBugPhx.PubSub,
           adapter: Phoenix.PubSub.PG2]

# FunWithFlags configuration
config :fun_with_flags, :cache_bust_notifications,
  enabled: true,
  adapter: FunWithFlags.Notifications.PhoenixPubSub,
  client: FunWithFlagsBugPhx.PubSub

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
