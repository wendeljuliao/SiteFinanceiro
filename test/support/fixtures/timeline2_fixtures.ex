defmodule Sitefinanceiro.Timeline2Fixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Sitefinanceiro.Timeline2` context.
  """

  @doc """
  Generate a despesa2.
  """
  def despesa2_fixture(attrs \\ %{}) do
    {:ok, despesa2} =
      attrs
      |> Enum.into(%{
        description: "some description",
        value: 120.5
      })
      |> Sitefinanceiro.Timeline2.create_despesa2()

    despesa2
  end
end
