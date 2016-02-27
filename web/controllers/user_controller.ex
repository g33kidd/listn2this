defmodule Listen.UserController do
  use Listen.Web, :controller
  alias Listen.{Repo, User}

  plug Listen.Plugs.EnsureAuthenticated when action in [:me]

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
