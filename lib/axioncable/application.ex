defmodule Axioncable.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc """
  Implementation of Axioncable server. This is compatible with Axioncable JS client.
  This implementation needs REDIS to store every websocket pid (value) into corresponding channel (key).
  For complete setup of this axioncable server, please check complete tutorial in the github page.
  Do not hesitate to write feedback / issue, this is a first version. Thanks.
  """

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: Axioncable.Worker.start_link(arg)
      # {Axioncable.Worker, arg},
      %{
        id: GenservPid,
        start: {GenservPid, :start_link, [%{}]}
      }
    ]

    # See https://hexdocs.pm/elixir/Axioncable.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Axioncable.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
