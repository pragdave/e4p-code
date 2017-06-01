defmodule Dictionary do

  alias Dictionary.WordList

  defdelegate start(), to: WordList, as: :word_list
  defdelegate random_word(word_list), to: WordList

end
