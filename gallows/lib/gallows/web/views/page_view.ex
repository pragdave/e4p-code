defmodule Gallows.Web.PageView do
  use Gallows.Web, :view

  def plural_of(word, 1), do: word
  def plural_of(word, _), do: word <> "s"

  def amount(val) when val < 0 do
    ~s{<span style="color: red">#{val}</span>}
  end
  
  def amount(val) do
    ~s{<span style="color: blue">#{val}</span>}
  end
  
end
