defmodule Tools.Parser do

  alias NimbleCSV.RFC4180, as: CSV

  def hello() do
    IO.puts "Hello world"
  end

  def parse_csv_from_file( file ) do
    file
      |> File.read!
      |> CSV.parse_string
      |> to_products
  end

  def to_products( products ) when is_list( products ) do
    for product <- products do
      [id, name, price] = product
      %Model.Product{id: id, name: name, price: price}
    end
  end

end
