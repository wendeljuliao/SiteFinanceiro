defmodule Sitefinanceiro.Timeline2.Despesa2 do
  use Ecto.Schema
  import Ecto.Changeset

  schema "despesas2" do
    field :description, :string
    field :value, :float

    belongs_to :user, Sitefinanceiro.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(despesa2, attrs) do
    despesa2
    |> cast(attrs, [:description, :value, :user_id])
    |> validate_required([:description, :value])
  end
end
