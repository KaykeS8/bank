defmodule BananaBank.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :nome, :string
    field :password_hash, :string
    field :email, :string
    field :cep, :string

    timestamps()
  end

  def changeset(user \\ %__MODULE__{}, params) do
    user
    |> cast(params, [:nome, :password_hash, :email, :cep])
    |> validate_required([:nome, :password_hash, :email, :cep])
    |> validate_length(:nome, min: 3)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:cep, is: 8)
  end
end
