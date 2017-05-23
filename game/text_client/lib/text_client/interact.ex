defmodule TextClient.Interact do

  def start() do
    Hangman.new_game()
    |> add_tally()
    |> play()
  end

  defp add_tally(game_service) do
    { game_service, Hangman.tally(game_service) }
  end

  defp play({_, %{ game_state: :won, letters: letters }}) do
    end_with_message("You WON!", letters)
  end
  
  defp play({_, %{ game_state: :lost, letters: letters }}) do
    end_with_message("Sorry, you lost...", letters)
  end

  defp play(game = {_, tally = %{ game_state: :good_guess}}) do
    IO.puts "Good guess!"
    continue(game)
  end

  defp play(game = {gs, tally = %{ game_state: :bad_guess}}) do
    IO.puts "That's not in the word..."
    continue(game)
  end

  defp play(game = {_, tally = %{ game_state: :already_used}}) do
    IO.puts "You already used that letter."
    continue(game)
  end
  
  defp play(game) do
    continue(game)
  end

  defp continue(game) do
    game
    |> display_status()
    |> accept_move()
    |> make_move()
    |> play()
  end

  defp display_status(game = {_, tally}) do
    IO.puts "\nWord so far: #{Enum.join(tally.letters, " ")}"
    IO.puts "Guesses left:  #{tally.turns_left}"
#    IO.puts "Letters used:  #{Enum.join(tally.used, " ")}"
    game
  end

  defp accept_move(game) do
    IO.gets("Your guess: ")
    |> check_input(game)
  end

  defp check_input({:error, reason}, _) do
    IO.puts("Game ended because #{reason}")
    exit(:normal)
  end

  defp check_input(_eof = nil, _) do
    IO.puts("Looks like you gave up...")
    exit(:normal)
  end

  defp check_input(input, game) do
    input = String.trim(input)
    cond do
      input =~ ~r/\A[a-z]\z/ ->
        { game, input }
      true ->
        IO.puts "please enter a lower-case letter"
        accept_move(game)
    end
  end
                                        
  defp make_move({game, guess}) do
    Hangman.make_move(elem(game, 0), guess)
  end

  defp end_with_message(msg, letters) do
    IO.puts(["\n", msg, "The word was #{Enum.join(letters)}"])
  end

end
