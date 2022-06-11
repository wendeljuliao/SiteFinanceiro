defmodule Sitefinanceiro.Timeline do
  @moduledoc """
  The Timeline context.
  """

  import Ecto.Query, warn: false
  alias Sitefinanceiro.Repo

  alias Sitefinanceiro.Timeline.Receita2

  @doc """
  Returns the list of receitas2.

  ## Examples

      iex> list_receitas2()
      [%Receita2{}, ...]

  """
  def list_receitas2(id) do
    Repo.all(from r in Receita2, where: [user_id: ^id], order_by: [desc: r.id])
  end

  @doc """
  Gets a single receita2.

  Raises `Ecto.NoResultsError` if the Receita2 does not exist.

  ## Examples

      iex> get_receita2!(123)
      %Receita2{}

      iex> get_receita2!(456)
      ** (Ecto.NoResultsError)

  """
  def get_receita2!(id), do: Repo.get!(Receita2, id)

  @doc """
  Creates a receita2.

  ## Examples

      iex> create_receita2(%{field: value})
      {:ok, %Receita2{}}

      iex> create_receita2(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_receita2(attrs \\ %{}) do
    %Receita2{}
    |> Receita2.changeset(attrs)
    |> Repo.insert()
    |> broadcast(:receita2_created)
  end

  @doc """
  Updates a receita2.

  ## Examples

      iex> update_receita2(receita2, %{field: new_value})
      {:ok, %Receita2{}}

      iex> update_receita2(receita2, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_receita2(%Receita2{} = receita2, attrs) do
    receita2
    |> Receita2.changeset(attrs)
    |> Repo.update()
    |> broadcast(:receita2_created)
  end

  @doc """
  Deletes a receita2.

  ## Examples

      iex> delete_receita2(receita2)
      {:ok, %Receita2{}}

      iex> delete_receita2(receita2)
      {:error, %Ecto.Changeset{}}

  """
  def delete_receita2(%Receita2{} = receita2) do
    Repo.delete(receita2)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking receita2 changes.

  ## Examples

      iex> change_receita2(receita2)
      %Ecto.Changeset{data: %Receita2{}}

  """
  def change_receita2(%Receita2{} = receita2, attrs \\ %{}) do
    Receita2.changeset(receita2, attrs)
  end

  def subscribe do
    Phoenix.PubSub.subscribe(Sitefinanceiro.PubSub, "receitas2")
  end

  defp broadcast({:error, _reason} = error, _event), do: error
  defp broadcast({:ok, receita2}, event) do
    Phoenix.PubSub.broadcast(Sitefinanceiro.PubSub, "receitas2", {event, receita2})
    {:ok, receita2}
  end

end
