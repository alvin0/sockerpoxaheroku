import Config
if Mix.env == :test do
  config :logger, backends: []
end

import System

config :poxa,
  port: get_env("PORT", "8080") |> String.to_integer(),
  app_key: get_env("POXA_APP_KEY", "35cfa3024e72a00ebf87fd49b4c79e13"),
  app_secret: get_env("POXA_SECRET", "7fd62e3127676f5fd22db9ce2ca6a98f"),
  app_id: get_env("POXA_APP_ID", "35cfa3024e72a00ebf87fd49b4c79e13"),
  registry_adapter: get_env("POXA_REGISTRY_ADAPTER", "gproc"),
  web_hook: get_env("WEB_HOOK", nil),
  payload_limit: get_env("PAYLOAD_LIMIT") || 10_000,
  activity_timeout: get_env("ACTIVITY_TIMEOUT", "120") |> String.to_integer()

config :poxa, :ssl,
  enabled: get_env("POXA_SSL", "false") == "true",
  port: get_env("SSL_PORT", "8443") |> String.to_integer(),
  cacertfile: get_env("SSL_CACERTFILE", ""),
  certfile: get_env("SSL_CERTFILE", ""),
  keyfile: get_env("SSL_KEYFILE", "")
