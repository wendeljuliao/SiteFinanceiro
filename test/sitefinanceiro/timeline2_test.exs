defmodule Sitefinanceiro.Timeline2Test do
  use Sitefinanceiro.DataCase

  alias Sitefinanceiro.Timeline2

  describe "despesas2" do
    alias Sitefinanceiro.Timeline2.Despesa2

    import Sitefinanceiro.Timeline2Fixtures

    @invalid_attrs %{description: nil, value: nil}

    test "list_despesas2/0 returns all despesas2" do
      despesa2 = despesa2_fixture()
      assert Timeline2.list_despesas2() == [despesa2]
    end

    test "get_despesa2!/1 returns the despesa2 with given id" do
      despesa2 = despesa2_fixture()
      assert Timeline2.get_despesa2!(despesa2.id) == despesa2
    end

    test "create_despesa2/1 with valid data creates a despesa2" do
      valid_attrs = %{description: "some description", value: 120.5}

      assert {:ok, %Despesa2{} = despesa2} = Timeline2.create_despesa2(valid_attrs)
      assert despesa2.description == "some description"
      assert despesa2.value == 120.5
    end

    test "create_despesa2/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Timeline2.create_despesa2(@invalid_attrs)
    end

    test "update_despesa2/2 with valid data updates the despesa2" do
      despesa2 = despesa2_fixture()
      update_attrs = %{description: "some updated description", value: 456.7}

      assert {:ok, %Despesa2{} = despesa2} = Timeline2.update_despesa2(despesa2, update_attrs)
      assert despesa2.description == "some updated description"
      assert despesa2.value == 456.7
    end

    test "update_despesa2/2 with invalid data returns error changeset" do
      despesa2 = despesa2_fixture()
      assert {:error, %Ecto.Changeset{}} = Timeline2.update_despesa2(despesa2, @invalid_attrs)
      assert despesa2 == Timeline2.get_despesa2!(despesa2.id)
    end

    test "delete_despesa2/1 deletes the despesa2" do
      despesa2 = despesa2_fixture()
      assert {:ok, %Despesa2{}} = Timeline2.delete_despesa2(despesa2)
      assert_raise Ecto.NoResultsError, fn -> Timeline2.get_despesa2!(despesa2.id) end
    end

    test "change_despesa2/1 returns a despesa2 changeset" do
      despesa2 = despesa2_fixture()
      assert %Ecto.Changeset{} = Timeline2.change_despesa2(despesa2)
    end
  end
end
