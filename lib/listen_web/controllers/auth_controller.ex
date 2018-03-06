defmodule ListenWeb.AuthController do
  use ListenWeb, :controller
  alias ListenWeb.Auth
  plug Ueberauth

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
    case Auth.find_or_create_user(auth) do
      {:ok, user} ->
        IO.inspect user
        finish_callback(conn, %{user: user})
      {:error, reason} -> finish_callback(conn, %{error: reason})
    end
  end

  def callback(%{assigns: %{ueberauth_failure: _fails}} = conn, params) do
    conn
    |> put_flash(:error, "Authentication failed. Please try again.")
    |> redirect(to: "/")
  end

  def finish_callback(conn, %{user: user}) do
    conn
    |> put_session(:current_user, user.id)
    |> put_flash(:info, "Logged in!")
    |> redirect(to: "/")
  end

  def finish_callback(conn, %{error: error}) do
    conn
    |> put_flash(:error, error)
    |> redirect(to: "/")
  end

  def logout(conn, params) do
    conn
    |> delete_session(:current_user)
    |> put_flash(:info, "You have signed out.")
    |> redirect(to: "/")
    |> halt()
  end

end
