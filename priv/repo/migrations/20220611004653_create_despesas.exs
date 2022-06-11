defmodule Sitefinanceiro.Repo.Migrations.CreateDespesas do
  use Ecto.Migration

  def change do
    create table(:despesas) do
      add :description, :string
      add :value, :float

      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end
  end
end
