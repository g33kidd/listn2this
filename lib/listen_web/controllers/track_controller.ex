defmodule ListenWeb.TrackController do
  use ListenWeb, :controller
  alias ListenWeb.{Repo, Track}

  plug :scrub_params, "track" when action in [:create]
  plug ListenWeb.Plugs.EnsureAuthenticated when action in [:create]

  def create(conn, %{"track" => track_params}) do
    user_id = get_session(conn, :current_user)
    params = Map.merge(track_params, %{"user_id" => user_id})
    changeset = Track.changeset %Track{}, params
    case Repo.insert changeset do
      {:ok, _track} ->
        conn
        |> put_flash(:info, "Created track!")
        |> redirect(to: "/")
      {:error, _changeset} ->
        conn
        |> put_flash(:error, "There was an error posting track.")
        |> redirect(to: "/")
    end
  end

end
