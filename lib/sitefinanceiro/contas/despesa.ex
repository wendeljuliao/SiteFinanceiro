defmodule Sitefinanceiro.Contas.Despesa do
  use Ecto.Schema
  import Ecto.Changeset

  schema "despesas" do
    field :description, :string
    field :value, :float

    belongs_to :user, Sitefinanceiro.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(despesa, attrs) do
    despesa
    |> cast(attrs, [:description, :value, :user_id])
    |> validate_required([:description, :value])
  end
end
