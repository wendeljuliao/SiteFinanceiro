defmodule Sitefinanceiro.ContasFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Sitefinanceiro.Contas` context.
  """

  @doc """
  Generate a receita.
  """
  def receita_fixture(attrs \\ %{}) do
    {:ok, receita} =
      attrs
      |> Enum.into(%{
        description: "some description",
        value: 120.5
      })
      |> Sitefinanceiro.Contas.create_receita()

    receita
  end
end
