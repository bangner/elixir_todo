defmodule Todo.Task do
  defstruct title: ""

  alias Todo.Task

  @data_path Path.join([__DIR__, "../../data"])

  def find(path) do
    title = File.read!(path)
    %Task{title: title}
  end

  def create(title) do
    path = path_for(title)
    File.write(path, title)
  end

  def all do
    for path <- Path.wildcard("#{@data_path}/*"), do: Task.find(path)
  end

  defp path_for(title) do
    path = Path.join([__DIR__, "../../data/", title|> String.downcase |> String.replace(~r/[^a-z0-9]/, "")])
  end
end