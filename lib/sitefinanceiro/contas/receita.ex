defmodule Sitefinanceiro.Contas.Receita do
  use Ecto.Schema
  import Ecto.Changeset

  schema "receitas" do
    field :description, :string
    field :value, :float

    belongs_to :user, Sitefinanceiro.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(receita, attrs) do
    receita
    |> cast(attrs, [:description, :value, :user_id])
    |> validate_required([:description, :value])
  end
end
