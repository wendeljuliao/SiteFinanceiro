defmodule Sitefinanceiro.Repo.Migrations.CreateReceitas do
  use Ecto.Migration

  def change do
    create table(:receitas) do
      add :description, :string
      add :value, :float

      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end
  end
end
