defmodule Solidarity.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema,
    user_id_field: :email,
    password_hash_methods: {&Pow.Ecto.Schema.Password.pbkdf2_hash/1,
                            &Pow.Ecto.Schema.Password.pbkdf2_verify/2},
    password_min_length: 10,
    password_max_length: 4096

  schema "users" do
    pow_user_fields()
    field :uuid, :string

    timestamps()
  end

   def changeset(user_or_changeset, attrs) do
    pow_changeset(user_or_changeset, attrs)
      |> Ecto.Changeset.put_change(:uuid, Ecto.UUID.generate())
  end
end
