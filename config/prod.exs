use Mix.Config

config :test_app, TestAppWeb.Endpoint,
  http: [port: {:system, "PORT"}],
  url: [scheme: "https", host: "guarded-beach-28060.herokuapp.com/", port: 443],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  cache_static_manifest: "priv/static/manifest.json",
  secret_key_base: Map.fetch!(System.get_env(), "SECRET_KEY_BASE")

# Do not print debug messages in production
config :logger, level: :info


# Configure your database
config :chatter, Chatter.Repo,
  adapter: Ecto.Adapters.Postgres,
  hostname: System.get_env("NEW_DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
  ssl: true,
  database: System.get_env("DATABASE"),
  username: System.get_env("USERNAME"),
  password: System.get_env("PASSWORD")
