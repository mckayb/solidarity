defmodule SolidarityWeb.PageController do
  use SolidarityWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
