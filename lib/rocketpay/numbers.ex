defmodule Rocketpay.Numbers do
  def sum_from_file(filename) do
    "#{filename}.csv"
    |> File.read()
    |> handle_fire()
  end

  defp handle_fire({:ok, result}) do
    result =
      result
      |> String.split(",")
      |> Enum.map(fn number -> String.to_integer(number) end)
      |> Enum.sum()

    {:ok, %{result: result}}
  end

  defp handle_fire({:error, _reason}), do: {:error, "Invalid File"}
end
