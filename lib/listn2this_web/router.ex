defmodule ListnWeb.Router do
  use ListnWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  forward "/api", Absinthe.Plug,
    schema: ListnWeb.Schema,
    pipeline: {ApolloTracing.Pipeline, :plug}

  if Mix.env() == :dev do
    forward "/gql", Absinthe.Plug.GraphiQL, schema: ListnWeb.Schema
  end

  scope "/", ListnWeb do
    pipe_through :browser

    get "/*all", PageController, :index
  end
end
