defmodule ListenWeb.PageController do
  use ListenWeb, :controller
  alias ListenWeb.{Repo, Track}

  def index(conn, _params) do
    query = from t in Track,
      limit: 50,
      order_by: [desc: :inserted_at],
      preload: [:user]

    render conn, "index.html", tracks: Repo.all(query)
  end

end
