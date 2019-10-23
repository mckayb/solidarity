defmodule SolidarityWeb.UserView do
  use SolidarityWeb, :view
  alias SolidarityWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      name: user.name,
      uuid: user.uuid,
      email: user.email}
  end
end
