defmodule Todo.TaskController do
  use Todo.Web, :controller

  def new(conn, _params) do
    html conn, """
    <!doctype html>
    <form method=post action=/task>
    <input type=text name=title placeholder="Enter task" />
    <input type=submit value=Save />
    </form>
    """
  end

  def create(conn, _params) do
    redirect conn, to: "/"
  end
end