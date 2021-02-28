defmodule RocketpayWeb.UsersController do
  use RocketpayWeb, :controller

  alias Rocketpay.User
  # alias Ecto.Repo

  action_fallback RocketpayWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Rocketpay.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end

  # def all(conn) do
  #   users = Repo.all(Rocketpay.User)
  #   conn
  #   |> put_status(:created)
  #   |> render("all.json", users: users)
  # end
end
