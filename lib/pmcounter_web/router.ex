defmodule PMCounterWeb.Router do
  use PMCounterWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v0", PMCounterWeb do
    pipe_through :api

    post "/count", CountController, :count
    get "/count", CountController, :get_count

    post "/register", RegisterController, :register
  end
end
