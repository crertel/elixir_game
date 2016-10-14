defmodule ElixirGame.Base do
  use GenServer
  alias ElixirGame.Base.BaseState

  def start_link(name) do
    GenServer.start_link(__MODULE__, :ok, [name: name] )
  end

  # note to self... handle_call ( msg, sender, oldstate )

  def handle_call( {:open_window, opts}, _from, curr_state) do
    IO.inspect opts
    {
      :reply,
      "Init window",
      %{ curr_state | current_window: curr_state.next_window,
                      next_window: (curr_state.next_window + 1 ) }
    }
  end

  def handle_call( {:close_window, _}, _from, curr_state) do
    {
      :reply,
      "Close window",
      %{ curr_state | current_window: 0,
                      next_window: (curr_state.next_window + 1 ) }
    }
  end

  def handle_call( {:poll_input, _}, _from, curr_state) do
    {
      :reply,
      "Poll input",
      curr_state
    }
  end

  def init( :ok ) do
    {:ok, %BaseState{} }
  end

end