defmodule ToyWeb.Router do
  use ToyWeb, :router
  import Phoenix.LiveDashboard.Router

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

  if Mix.env() == :dev do
    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard"
    end
  end

  scope "/", ToyWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", ToyWeb do
  #   pipe_through :api
  # end
end
