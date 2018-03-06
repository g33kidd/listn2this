defmodule ListenWeb.UserController do
  use ListenWeb, :controller

  import Ecto.Query

  alias Listen.Repo
  alias Listen.Accounts.User

  plug ListenWeb.Plugs.EnsureAuthenticated when action in [:me]

  def me(conn, _params) do
    user_id = get_session(conn, :current_user)
    query = from u in User,
      where: u.id == ^ user_id,
      preload: [:tracks]

    render conn, "show.html", user: Repo.one(query)
  end

  def show(conn, %{"username" => username}) do
    query = from u in User,
      where: u.username == ^username,
      preload: [:tracks]

    render conn, "show.html", user: Repo.one(query)
  end

end
