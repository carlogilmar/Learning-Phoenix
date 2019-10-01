defmodule GuardianToyWeb.Router do
  use GuardianToyWeb, :router

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

  pipeline :browser_pipeline do
    plug GuardianToy.Guardian.BrowserPipeline
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

  scope "/", GuardianToyWeb do
    pipe_through :browser

    get "/", PageController, :index
    post "/", PageController, :index

  end

  scope "/admin", GuardianToyWeb do
    pipe_through [:browser, :browser_pipeline, :ensure_auth]
    get "/home", PageController, :home
  end

  # Other scopes may use custom stacks.
  # scope "/api", GuardianToyWeb do
  #   pipe_through :api
  # end
end
