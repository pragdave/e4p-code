defmodule Dictionary.Application do

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Dictionary.WordList, []),
    ]

    options = [
      strategy: :one_for_one,
      name: Dictionary.Supervisor
    ]
    
    Supervisor.start_link(children, options)
  end
end
