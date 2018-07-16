defmodule Module do

  def parser("Enero") do
    IO.inspect :enero
  end

  def parser(_) do
    IO.inspect :no_es_enero
  end

end

Module.parser "Enero"
Module.parser "Febrero"
