defmodule Sitefinanceiro.ContasTest do
  use Sitefinanceiro.DataCase

  alias Sitefinanceiro.Contas

  describe "receitas" do
    alias Sitefinanceiro.Contas.Receita

    import Sitefinanceiro.ContasFixtures

    @invalid_attrs %{description: nil, value: nil}

    test "list_receitas/0 returns all receitas" do
      receita = receita_fixture()
      assert Contas.list_receitas() == [receita]
    end

    test "get_receita!/1 returns the receita with given id" do
      receita = receita_fixture()
      assert Contas.get_receita!(receita.id) == receita
    end

    test "create_receita/1 with valid data creates a receita" do
      valid_attrs = %{description: "some description", value: 120.5}

      assert {:ok, %Receita{} = receita} = Contas.create_receita(valid_attrs)
      assert receita.description == "some description"
      assert receita.value == 120.5
    end

    test "create_receita/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Contas.create_receita(@invalid_attrs)
    end

    test "update_receita/2 with valid data updates the receita" do
      receita = receita_fixture()
      update_attrs = %{description: "some updated description", value: 456.7}

      assert {:ok, %Receita{} = receita} = Contas.update_receita(receita, update_attrs)
      assert receita.description == "some updated description"
      assert receita.value == 456.7
    end

    test "update_receita/2 with invalid data returns error changeset" do
      receita = receita_fixture()
      assert {:error, %Ecto.Changeset{}} = Contas.update_receita(receita, @invalid_attrs)
      assert receita == Contas.get_receita!(receita.id)
    end

    test "delete_receita/1 deletes the receita" do
      receita = receita_fixture()
      assert {:ok, %Receita{}} = Contas.delete_receita(receita)
      assert_raise Ecto.NoResultsError, fn -> Contas.get_receita!(receita.id) end
    end

    test "change_receita/1 returns a receita changeset" do
      receita = receita_fixture()
      assert %Ecto.Changeset{} = Contas.change_receita(receita)
    end
  end
end
