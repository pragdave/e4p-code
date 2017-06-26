defmodule Gallows.Web.PageController do
  use Gallows.Web, :controller

  def index(conn, _params) do
    my_assigns = %{ produce: "pear", count: 3 }
    render conn, "index.html", my_assigns
  end
end
