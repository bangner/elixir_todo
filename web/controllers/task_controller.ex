defmodule Todo.TaskController do
  use Todo.Web, :controller

  @data_path Path.join([__DIR__, "../../data/"])

  def index(conn, _params) do
    task_files = Path.wildcard("#{@data_path}/*")
    tasks_html = for f <- task_files, do: "<li>#{File.read!(f)}</li>"
    html conn, """
    <!doctype html>
    <a href=/task/new>New Task</a>
    <ol>
    #{tasks_html}
    </ol>
    """
  end

  def new(conn, _params) do
    html conn, """
    <!doctype html>
    <form method=post action=/task>
    <input type=text name=title placeholder="Enter task" />
    <input type=submit value=Save />
    </form>
    """
  end

  def create(conn, %{"title" => title}) do
    path = Path.join([__DIR__, "../../data/", title|> String.downcase|>String.replace(~r/[^a-z0-9]/, "")])
    File.write(path, title)
    redirect conn, to: "/tasks"
  end
end