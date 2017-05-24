defmodule TextClient.Player do

  alias TextClient.{Mover, Prompt, State, Summary}
  
  def play(%State{tally: %{ game_state: :won, letters: letters }}) do
    end_with_message("You WON!", letters)
  end
  
  def play(%State{tally: %{ game_state: :lost, letters: letters }}) do
    end_with_message("Sorry, you lost...", letters)
  end

  def play(game = %State{ tally: %{ game_state: :good_guess }}) do
    continue_with_message(game, "Good guess!")
  end

  def play(game = %State{ tally: %{ game_state: :bad_guess }}) do
    continue_with_message(game, "That's not in the word...")
  end

  def play(game = %State{tally: %{ game_state: :already_used }}) do
    continue_with_message(game, "You already used that letter")
  end
  
  def play(game = %State{}) do
    continue(game)
  end

  defp continue_with_message(game, message) do
    IO.puts message
    continue(game)
  end
  
  defp continue(game = %State{}) do
    game
    |> Summary.display()
    |> Prompt.accept_move()
    |> Mover.make_move()
    |> play()
  end


  defp end_with_message(msg, letters) do
    IO.puts(["\n", msg, "The word was #{Enum.join(letters)}"])
  end

  
end
