defmodule ElixirGame do
  use Application

  @application_name ElixirGame.Base

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Define workers and child supervisors to be supervised
    children = [
      # Starts a worker by calling: ElixirGame.Worker.start_link(arg1, arg2, arg3)
      worker(@application_name, [@application_name]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirGame.Supervisor]
    Supervisor.start_link(children, opts)
  end

  #
  # Window functions
  #
  def open_window( opts \\ [] ) do
    GenServer.call(ElixirGame.Base, {:open_window, opts} )
  end
  def close_window( ) do
    GenServer.call(ElixirGame.Base, {:close_window, nil} )
  end

  #
  # Register for input
  #
  def poll_input( ) do
    GenServer.call(ElixirGame.Base, {:poll_input, nil} )
  end

end
