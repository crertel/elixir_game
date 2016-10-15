# ElixirGame

ElixirGame is a really gross and simple API for making games and other visualizations.

## Supported operations

### Window operations
* Create a window
* Destroy a window

### Poll input
* Get posted events

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `elixir_game` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:elixir_game, "~> 0.1.0"}]
    end
    ```

  2. Ensure `elixir_game` is started before your application:

    ```elixir
    def application do
      [applications: [:elixir_game]]
    end
    ```

