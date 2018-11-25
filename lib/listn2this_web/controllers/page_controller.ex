defmodule ListnWeb.PageController do
  use ListnWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
