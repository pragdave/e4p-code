defmodule TextClient.Interact do

  alias TextClient.{Player, State}
  
  def start() do
    Hangman.new_game()
    |> setup_state()
    |> Player.play()
  end

  defp setup_state(game_service) do
    %State{
      game_service: game_service,
      tally:        Hangman.tally(game_service),
    }
  end

                                        
end
