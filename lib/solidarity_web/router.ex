defmodule SolidarityWeb.Router do
  use SolidarityWeb, :router
  import Phoenix.LiveView.Router
  use Pow.Phoenix.Router

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

  pipeline :protected do
    plug Pow.Plug.RequireAuthenticated,
      error_handler: Pow.Phoenix.PlugErrorHandler
  end

  scope "/" do
    pipe_through :browser

    pow_routes()
  end

  scope "/", SolidarityWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/", SolidarityWeb do
    pipe_through [:browser, :protected]

    live "/clock", ClockLive
  end

  scope "/api", SolidarityWeb do
    pipe_through [:api, :protected]
  end
end
