import Config

# Only in tests, remove the complexity from the password hashing algorithm
config :pbkdf2_elixir, :rounds, 1

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :sitefinanceiro, Sitefinanceiro.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "sitefinanceiro_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :sitefinanceiro, SitefinanceiroWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "oVbMq2aljsZ0nchyV+sMGb8MLNCaD15hxYhkN4IXR38FusLvow4XKcwbQQgNSKdd",
  server: false

# In test we don't send emails.
config :sitefinanceiro, Sitefinanceiro.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
