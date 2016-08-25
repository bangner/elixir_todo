defmodule Todo.PageController do
  use Todo.Web, :controller

  def index(conn, _params) do
    text conn, "Hello Phoenix"
    #render conn, "index.html"
  end
end