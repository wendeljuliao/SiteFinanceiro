defmodule Sitefinanceiro.TimelineFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Sitefinanceiro.Timeline` context.
  """

  @doc """
  Generate a receita2.
  """
  def receita2_fixture(attrs \\ %{}) do
    {:ok, receita2} =
      attrs
      |> Enum.into(%{
        description: "some description",
        value: 120.5
      })
      |> Sitefinanceiro.Timeline.create_receita2()

    receita2
  end
end
