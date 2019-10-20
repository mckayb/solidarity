defmodule SolidarityWeb.Router do
  use SolidarityWeb, :router
  import Phoenix.LiveView.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SolidarityWeb do
    pipe_through :browser

    get "/", PageController, :index
    live "/clock", ClockLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", SolidarityWeb do
  #   pipe_through :api
  # end
end
