defmodule Sitefinanceiro.Contas.Receita do
  use Ecto.Schema
  import Ecto.Changeset

  schema "receitas" do
    field :description, :string
    field :value, :float

    timestamps()
  end

  @doc false
  def changeset(receita, attrs) do
    receita
    |> cast(attrs, [:description, :value])
    |> validate_required([:description, :value])
  end
end
