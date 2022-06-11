defmodule Sitefinanceiro.Repo.Migrations.CreateReceitas2 do
  use Ecto.Migration

  def change do
    create table(:receitas2) do
      add :description, :string
      add :value, :float

      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end
  end
end
