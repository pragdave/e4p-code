defmodule TextClient.Mover do

  alias TextClient.State
  
  def make_move(game = %State{}) do
    { gs, tally } = Hangman.make_move(game.game_service, game.guess)
    %State{ game | game_service: gs, tally: tally }
  end
end
