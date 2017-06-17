defmodule Dictionary.Application do

  use Application

  def start_link(_type, _args) do
    Dictionary.WordList.start_link()
  end

end
