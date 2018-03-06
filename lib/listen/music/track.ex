defmodule Listen.Music.Track do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query
  alias Listen.Accounts.User

  schema "tracks" do
    field :name, :string
    field :link, :string
    field :provider, :string
    belongs_to :user, User

    timestamps
  end

  @required_fields ~w(name link user_id)
  @optional_fields ~w(provider)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:link)
    |> validate_length(:name, min: 3)
    |> update_provider()
    |> validate_format(:provider, ~r/^(spotify|soundcloud|youtube)$/)
  end

  def update_provider(changeset) do
    parts =
      get_change(changeset, :link)
      |> URI.parse()
      |> split_parts()

    provider =
      parts
      |> length()
      |> case do
        2 -> List.first(parts)
        3 -> List.first(List.delete_at(parts, 0))
      end

    put_change(changeset, :provider, provider)
  end

  defp split_parts(%{host: host}), do: String.split(host, ".")
end
