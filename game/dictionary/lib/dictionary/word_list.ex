defmodule Dictionary.WordList do

  words_with_index =
    "../../assets/words.txt"
    |> File.stream!()
    |> Enum.with_index(1)

  @spec lookup_in_wordlist(pos_integer) :: String.t
  defp lookup_in_wordlist(index)
  
  Enum.map(words_with_index, fn {word, index} ->
    defp lookup_in_wordlist(unquote(index)), do: unquote(word)
  end)
  
  {_word, word_list_last_index} = List.last(words_with_index)

  @spec random_word() :: String.t
  def random_word() do
    unquote(word_list_last_index)
    |> :rand.uniform()
    |> lookup_in_wordlist()
  end
end
