defmodule PMCounterWeb.Router do
  use PMCounterWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PMCounterWeb do
    pipe_through :api
  end
end
