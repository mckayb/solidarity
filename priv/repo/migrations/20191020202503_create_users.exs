defmodule Solidarity.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :uuid, :string
      add :email, :string
      add :username, :string
      add :password, :string

      timestamps()
    end

  end
end
