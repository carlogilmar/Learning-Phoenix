defmodule Tools.Parser do

  alias NimbleCSV.RFC4180, as: CSV

  def hello() do
    IO.puts "Hello world"
  end

  def parse_csv_from_file( file ) do
    file
      |> File.read!
      |> CSV.parse_string
  end

end
