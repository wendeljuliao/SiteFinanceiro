defmodule Sitefinanceiro.TimelineTest do
  use Sitefinanceiro.DataCase

  alias Sitefinanceiro.Timeline

  describe "receitas2" do
    alias Sitefinanceiro.Timeline.Receita2

    import Sitefinanceiro.TimelineFixtures

    @invalid_attrs %{description: nil, value: nil}

    test "list_receitas2/0 returns all receitas2" do
      receita2 = receita2_fixture()
      assert Timeline.list_receitas2() == [receita2]
    end

    test "get_receita2!/1 returns the receita2 with given id" do
      receita2 = receita2_fixture()
      assert Timeline.get_receita2!(receita2.id) == receita2
    end

    test "create_receita2/1 with valid data creates a receita2" do
      valid_attrs = %{description: "some description", value: 120.5}

      assert {:ok, %Receita2{} = receita2} = Timeline.create_receita2(valid_attrs)
      assert receita2.description == "some description"
      assert receita2.value == 120.5
    end

    test "create_receita2/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Timeline.create_receita2(@invalid_attrs)
    end

    test "update_receita2/2 with valid data updates the receita2" do
      receita2 = receita2_fixture()
      update_attrs = %{description: "some updated description", value: 456.7}

      assert {:ok, %Receita2{} = receita2} = Timeline.update_receita2(receita2, update_attrs)
      assert receita2.description == "some updated description"
      assert receita2.value == 456.7
    end

    test "update_receita2/2 with invalid data returns error changeset" do
      receita2 = receita2_fixture()
      assert {:error, %Ecto.Changeset{}} = Timeline.update_receita2(receita2, @invalid_attrs)
      assert receita2 == Timeline.get_receita2!(receita2.id)
    end

    test "delete_receita2/1 deletes the receita2" do
      receita2 = receita2_fixture()
      assert {:ok, %Receita2{}} = Timeline.delete_receita2(receita2)
      assert_raise Ecto.NoResultsError, fn -> Timeline.get_receita2!(receita2.id) end
    end

    test "change_receita2/1 returns a receita2 changeset" do
      receita2 = receita2_fixture()
      assert %Ecto.Changeset{} = Timeline.change_receita2(receita2)
    end
  end
end
