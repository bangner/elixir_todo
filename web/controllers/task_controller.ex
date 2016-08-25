defmodule  Todo.TaskController do
  use Todo.Web, :controller
  alias Todo.Task

  def index(conn, _params) do
    render conn, "index.html", tasks: Task.all
  end

  def new(conn, _params) do
    render conn, :new
  end

  def create(conn, %{"task" => %{"title" => title} }) do
    Task.create(title)
    redirect conn, to: "/task"
  end

end