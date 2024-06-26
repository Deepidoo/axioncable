# Axioncable

[![Build Status](https://github.com/Deepidoo/axioncable/workflows/elixir/badge.svg)](https://github.com/Deepidoo/axioncable/actions)

## Installation

### - 1) Add the `:axioncable` dependency to your mix.exs file

```elixir
defp deps() do
  [
    {:axioncable, "~> 0.2.0"}
  ]
```

Then, run `mix deps.get` in your shell to fetch the new dependencies.


### - 2) Add this configuration in config/config.ex,

```elixir
config :application, ApplicationWeb.Endpoint,
  check_origin: false,
    http: [
      dispatch: [
        {:_, [
          {"/cable", SocketHandler, []},
          {:_, Phoenix.Endpoint.Cowboy2Handler, {ApplicationWeb.Endpoint, []}}
        ]}
      ]
    ],
    subprotocols: ["actioncable-v1-json"]
```

It will redirect every url ending by "/cable" to Cowboy Websocket Handler.
Other url will be redirect in your Endpoint as usual.

### - 3) Create module : `SocketHandler`

```elixir
defmodule SocketHandler do
  use Axioncable.SocketHandler

  def handle_client_message(message) do
    #Handle message from JS client the way you want it ;)
    IO.inspect message
  end

end

```

This module has to `use Axioncable.SocketHandler`and implement `handle_client_message`function.


### Usage

- Receive message : As seen above, every message will be transfered in this function : `handle_client_message(message)` (In `SocketHandler` module)

- Send message: 

If the JS client subscribe with `{channel: "XXX", id: "XXX"}` :

   use `Axioncable.Channel.broadcast(channel, id, message)`

    Example:
```elixir
    iex>  Axioncable.Channel.broadcast("room", "1", %{"action"=>"write", "args" => "hello"})

    iex>  Axioncable.Channel.broadcast("room", "1", %{"action"=>"write"})
```

    Broadcast message to all subscriber from given channel.

else (subscription in JS with channel only)

   use `Axioncable.Channel.broadcast(channel, message)`

    Example:
```elixir 
    iex> Axioncable.Channel.broadcast("room_1", %{"action"=>"write", "args" => "hello"})

    iex> Axioncable.Channel.broadcast("room_1", %{"action"=>"write"})
```

    Broadcast message to all subscriber from given channel. 

### Development

This project use asdf with a `tool-versions`.

Install [asdf](https://asdf-vm.com/guide/getting-started.html) and the differents plugins.

```sh
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
```

Then install the version specified in `.tool-versions`

```sh
asdf install
```

The code is formatted using `mix format`

### Improvement

- Do not hesitate to perform pull request, this is a first version and there are a lot of things that need to be improved
