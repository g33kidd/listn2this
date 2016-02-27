defmodule Listen.Track do
  use Listen.Web, :model

  schema "tracks" do
    field :name, :string
    field :link, :string
    field :provider, :string
    belongs_to :user, Listen.User

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
  end

  def update_provider(changeset) do
    provider = get_change(changeset, :link)
    |> URI.parse()
    |> Map.from_struct()
    |> Map.get(:host)
    |> get_site_name()

    changeset |> put_change(:provider, provider)
  end

  # soundcloud.com
  # open.spotify.com
  # play.spotify.com
  def get_site_name(site) do
    parts = String.split(site, ".")
    if length(parts) == 2, do: List.first(parts)
    if length(parts) == 3 do
      parts
      |> List.delete_at(0)
      |> List.first()
    end
  end

end
