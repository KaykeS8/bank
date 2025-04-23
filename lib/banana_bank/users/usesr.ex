defmodule BananaBank.User do
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
  end
end
