defmodule MailveProject.ReadCSV do
  def read(file) do
    data = String.split(file, ~r"\n")
    list_of_data = Enum.map(data, &(if String.contains?(&1, "\""), do: String.split(&1, "\","), else: String.split(&1, ",")))
    headers = list_of_data |> List.first()
    list_of_data_without_headers = list_of_data -- [headers]
    data_to_map(headers, list_of_data_without_headers)
  end

  def get_headers(file) do
    data = String.split(file, ~r"\n")
    list_of_data = Enum.map(data, &(if String.contains?(&1, "\""), do: String.split(&1, "\","), else: String.split(&1, ",")))
    list_of_data |> List.first()
  end

  def data_to_map(headers, data) do
    for(data_position <- 0 .. Enum.count(data) - 1) do
      actual_data = Enum.at(data, data_position)
      for (column <- 0 .. Enum.count(actual_data) - 1) do
        {Enum.at(headers, column), Enum.at(actual_data, column)}
      end
      |> Enum.into(%{})
    end
  end
end
