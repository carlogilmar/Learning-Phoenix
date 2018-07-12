defmodule CommunityWeb.Router do
  use CommunityWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CommunityWeb do
    pipe_through :api
  end

  forward "/graphiql", Absinthe.Plug.GraphiQL, schema: CommunityWeb.Schema, interface: :simple, context: %{pubsub: CommunityWeb.Endpoint}
end
