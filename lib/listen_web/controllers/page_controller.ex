defmodule ListenWeb.PageController do
  use ListenWeb, :controller

  import Ecto.Query

  alias Listen.Repo
  alias Listen.Music.Track

  def index(conn, _params) do
    query = from t in Track,
      limit: 50,
      order_by: [desc: :inserted_at],
      preload: [:user]

    render conn, "index.html", tracks: Repo.all(query)
  end

end
