defmodule Sitefinanceiro.Repo.Migrations.CreateReceitas do
  use Ecto.Migration

  def change do
    create table(:receitas) do
      add :description, :string
      add :value, :float

      timestamps()
    end
  end
end
