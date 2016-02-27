defmodule Listen.Auth do
  alias Listen.{Repo, User}

  @doc """
  Finds or creates a user based on the authentication information given back
  by Ueberauth callbacks. Attemtps to find the user by their username.
  """
  def find_or_create_user(auth) do
    auth_info = basic_info(auth)
    case User.find_by_username(auth_info.username) do
      {:ok, user} -> {:ok, user}
      nil -> create_user(auth_info)
    end
  end

  @doc """
  Creates a user.
  """
  def create_user(params) do
    case User.create(params) do
      {:ok, user} -> {:ok, user}
      {:error, changeset} -> {:error, changeset}
    end
  end

  @doc """
  Returns a `Map` of some basic info from the `%Auth{}` struct needed to create
  a user account.
  """
  def basic_info(auth) do
    %{username: auth.info.nickname,
      image_url: auth.info.image}
  end

  @doc """
  Checks if the `:current_user` session is set.
  """
  def logged_in?(conn) do
    if Plug.Conn.get_session(conn, :current_user) do
      true
    else
      false
    end
  end

end
