# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

# Configures the endpoint
# config :axioncable, AxioncableWeb.Endpoint,
#   url: [host: "localhost"],
#   secret_key_base: "Q+LwpKah40V7YN3pbNCE44LabmnBBJ0jMHPSqbVOJr0xP7kSUgleWKKTNbaeO88W",
#   render_errors: [view: AxioncableWeb.ErrorView, accepts: ~w(html json)],
#   pubsub: [name: Axioncable.PubSub, adapter: Phoenix.PubSub.PG2],
#   check_origin: false,
#   http: [
#     dispatch: [
#       {:_, [
#         {"/cable", AxioncableWeb.SocketHandler, []},
#         {:_, Phoenix.Endpoint.Cowboy2Handler, {AxioncableWeb.Endpoint, []}}
#       ]}
#     ]
#   ],
#   subprotocols: ["actioncable-v1-json"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
# config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
