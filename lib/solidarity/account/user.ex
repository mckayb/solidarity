defmodule Solidarity.Account.User do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:email, :name, :username, :uuid]}
  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string
    field :username, :string
    field :uuid, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :uuid, :email, :username, :password])
    |> validate_required([:name, :uuid, :email, :username, :password])
  end
end
