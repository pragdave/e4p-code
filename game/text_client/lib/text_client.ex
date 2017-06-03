defmodule TextClient do

  defdelegate start(), to: TextClient.Interact
  
end
