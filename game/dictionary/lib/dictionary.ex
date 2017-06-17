defmodule Dictionary do

  alias Dictionary.WordList

  defdelegate random_word(), to: WordList

end
