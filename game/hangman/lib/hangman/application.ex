defmodule Hangman.Application do
  
  use Application
  
  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    
    children = [
      worker(Hangman.Server, []),
    ]
    
    options = [
      name:     Hangman.Supervisor,
      strategy: :simple_one_for_one,
    ]
    
    Supervisor.start_link(children, options)
  end

end
