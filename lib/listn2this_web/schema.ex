defmodule ListnWeb.Schema do
  use Absinthe.Schema
  use ApolloTracing

  # TODO: At some point, may want to separate these into own modules... for organization purposes.
  # TODO: Look into Dataloader?

  @desc "Provider object"
  object :provider do
    field :id, non_null(:id)
    field :name, :string
    field :slug, :string
  end

  @desc "User object"
  object :user do
    field :id, non_null(:id)
    field :username, non_null(:string)
    # TODO: resolve these fields
    # field :tracks, list_of(:track)
  end

  @desc "Track object"
  object :track do
    field :id, non_null(:id)
    field :title, :string
    field :url, :string
    field :provider, :provider
    field :user, :user
    # TODO: resolve these fields
    # field :votes, :integer
    # field :user_votes
  end

  object :room do
    field :id, non_null(:id)
    field :name, :string
    field :description, :string
    # TODO: resolve these fields
    # field :subscriber_count, :integer
    # field :subscribers, list_of(:user)
    field :user, :user
  end

  query do
    field :tracks, list_of(:track) do
      resolve fn _, _, _ -> {:ok, nil} end
    end
  end
end
