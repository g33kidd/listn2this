defmodule ListenWeb.Router do
  use ListenWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", ListenWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    post "/tracks/create", TrackController, :create
    get "/logout", AuthController, :logout

    get "/me", UserController, :me
    get "/:username", UserController, :show
  end

  scope "/auth", Listen do
    pipe_through :browser

    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
  end
end
