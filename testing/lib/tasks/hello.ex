defmodule Mix.Tasks.Hello do

  use Mix.Task

  def run(_args) do
    Mix.shell.info "Hello world!"
  end

end
