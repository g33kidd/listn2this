defmodule ListenWeb.Plugs.EnsureAuthenticated do
  alias ListenWeb.{Repo, User}
  import Plug.Conn

  def init(opts), do: opts
  def call(conn, _params) do
    if id = Plug.Conn.get_session(conn, :current_user) do
      user = Repo.get User, id
      assign(conn, :current_user, user)
    else
      conn |> send_resp(401, "Not Authorized") |> halt()
    end
  end

end
