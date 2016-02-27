defmodule Listen.PageController do
  use Listen.Web, :controller
  alias Listen.{Repo, Track}

  def index(conn, _params) do
    query = from t in Track,
      order_by: [desc: :inserted_at],
      preload: [:user]

    render conn, "index.html", tracks: Repo.all(query)
  end

end
