defmodule Sitefinanceiro.Timeline.Receita2 do
  use Ecto.Schema
  import Ecto.Changeset

  schema "receitas2" do
    field :description, :string
    field :value, :float

    belongs_to :user, Sitefinanceiro.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(receita2, attrs) do
    receita2
    |> cast(attrs, [:description, :value, :user_id])
    |> validate_required([:description, :value])
  end
end
