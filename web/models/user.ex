defmodule Listen.User do
  use Listen.Web, :model
  alias Listen.{Repo, User}

  schema "users" do
    field :username, :string
    has_many :tracks, Listen.Track

    timestamps
  end

  @required_fields ~w(username)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:username)
  end

  @doc """
  Will create a changeset and attempt to insert into the Repo. Up to the
  controller, etc... to implement checking for errors and successes.
  """
  def create(params) do
    changeset = User.changeset %User{}, params
    Repo.insert changeset
  end

  @doc """
  Finds a user by their `username`.
  """
  def find_by_username(username) do
    query = from u in User, where: u.username == ^username
    case Repo.one(query) do
      nil -> nil
      user -> {:ok, user}
    end
  end

end
