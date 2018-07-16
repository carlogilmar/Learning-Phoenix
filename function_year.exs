
defmodule Module do

  @current_year NaiveDateTime.utc_now.year

  def check( @current_year ) do
    IO.puts "Estamos en el 2018"
  end

  def parser(_) do
    IO.puts "NOOo Estamos en el 2018"
  end

end

Module.parser "2018"
Module.parser "2019"
