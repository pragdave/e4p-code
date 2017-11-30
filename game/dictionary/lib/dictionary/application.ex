defmodule Dictionary.Application do

  use Application

  def start(_type, _args) do
    Dictionary.WordList.start_link()
  end

end
