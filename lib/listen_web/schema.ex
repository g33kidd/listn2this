defmodule ListenWeb.Schema do
  use Absinthe.Schema

  alias Listen.Resolver

  object :user do
    field :id, non_null(:id)
    field :username, non_null(:string)
  end

  object :track do
    field :id, non_null(:id)
    field :name, :string
    field :link, :string
    field :provider, :string
  end

  query do
    field :tracks, list_of(:track) do
      resolve &Resolver.get_tracks/3
    end
  end
end
