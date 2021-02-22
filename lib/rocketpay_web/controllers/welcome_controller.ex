defmodule RocketpayWeb.WelcomeController do
  use RocketpayWeb, :controller

  alias Rocketpay.Numbers

  def index(conn, %{"filename" => filename}) do
    filename
    |> Numbers.sum_from_file()
    |> handle_response(conn)
  end

  defp handle_response({:ok, %{result: result}}, conn) do
    conn
    |> put_status(:ok)
    |> json(%{message: "Welcome to Rocketpay API. Here isn yout number #{result}"})

    {:ok, %{result: result}}
  end

end
