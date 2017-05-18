defmodule Hangman do
  def hello do
    IO.puts Dictionary.random_word()
  end
end
