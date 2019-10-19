defmodule Solidarity.Repo do
  use Ecto.Repo,
    otp_app: :solidarity,
    adapter: Ecto.Adapters.Postgres
end
