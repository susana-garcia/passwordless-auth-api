use Mix.Config

config :passwordless_auth, PasswordlessAuthWeb.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false

# ## SSL Support
#
# In order to use HTTPS in development, a self-signed
# certificate can be generated by running the following
# Mix task:
#
#     mix phx.gen.cert
#
# Note that this task requires Erlang/OTP 20 or later.
# Run `mix help phx.gen.cert` for more information.
#
# The `http:` config above can be replaced with:
#
#     https: [
#       port: 4001,
#       cipher_suite: :strong,
#       keyfile: "priv/cert/selfsigned_key.pem",
#       certfile: "priv/cert/selfsigned.pem"
#     ],
#
# If desired, both `http:` and `https:` keys can be
# configured to run both http and https servers on
# different ports.

# Watch static and templates for browser reloading.
config :passwordless_auth, PasswordlessAuthWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{lib/passwordless_auth_web/views/.*(ex)$},
      ~r{lib/passwordless_auth_web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Initialize plugs at runtime for faster development compilation
config :phoenix, :plug_init_mode, :runtime

# Configure your database
config :passwordless_auth, PasswordlessAuth.Repo,
  username: "postgres",
  password: "postgres",
  database: "passwordless_auth_dev",
  hostname: "localhost",
  pool_size: 10

config :passwordless_auth, PasswordlessAuthWeb.Mailer,
  # adapter: Swoosh.Adapters.Mailgun,
  adapter: Swoosh.Adapters.Local,
  # TODO: add your sandbox domain here
  domain: "sandbox-your-domain.mailgun.org",
  # TODO: add your api key here
  api_key: "your-key",
  from_address: {"passwordless_auth", "hello@passwordless-auth.com"}
