defmodule Sitefinanceiro.Timeline2 do
  @moduledoc """
  The Timeline2 context.
  """

  import Ecto.Query, warn: false
  alias Sitefinanceiro.Repo

  alias Sitefinanceiro.Timeline2.Despesa2

  @doc """
  Returns the list of despesas2.

  ## Examples

      iex> list_despesas2()
      [%Despesa2{}, ...]

  """
  def list_despesas2(id) do
    Repo.all(from d in Despesa2, where: [user_id: ^id], order_by: [desc: d.id])
  end

  @doc """
  Gets a single despesa2.

  Raises `Ecto.NoResultsError` if the Despesa2 does not exist.

  ## Examples

      iex> get_despesa2!(123)
      %Despesa2{}

      iex> get_despesa2!(456)
      ** (Ecto.NoResultsError)

  """
  def get_despesa2!(id), do: Repo.get!(Despesa2, id)

  @doc """
  Creates a despesa2.

  ## Examples

      iex> create_despesa2(%{field: value})
      {:ok, %Despesa2{}}

      iex> create_despesa2(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_despesa2(attrs \\ %{}) do
    %Despesa2{}
    |> Despesa2.changeset(attrs)
    |> Repo.insert()
    |> broadcast(:despesa2_created)
  end

  @doc """
  Updates a despesa2.

  ## Examples

      iex> update_despesa2(despesa2, %{field: new_value})
      {:ok, %Despesa2{}}

      iex> update_despesa2(despesa2, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_despesa2(%Despesa2{} = despesa2, attrs) do
    despesa2
    |> Despesa2.changeset(attrs)
    |> Repo.update()
    |> broadcast(:despesa2_created)
  end

  @doc """
  Deletes a despesa2.

  ## Examples

      iex> delete_despesa2(despesa2)
      {:ok, %Despesa2{}}

      iex> delete_despesa2(despesa2)
      {:error, %Ecto.Changeset{}}

  """
  def delete_despesa2(%Despesa2{} = despesa2) do
    Repo.delete(despesa2)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking despesa2 changes.

  ## Examples

      iex> change_despesa2(despesa2)
      %Ecto.Changeset{data: %Despesa2{}}

  """
  def change_despesa2(%Despesa2{} = despesa2, attrs \\ %{}) do
    Despesa2.changeset(despesa2, attrs)
  end

  def subscribe do
    Phoenix.PubSub.subscribe(Sitefinanceiro.PubSub, "despesas2")
  end

  defp broadcast({:error, _reason} = error, _event), do: error
  defp broadcast({:ok, despesa2}, event) do
    Phoenix.PubSub.broadcast(Sitefinanceiro.PubSub, "despesas2", {event, despesa2})
    {:ok, despesa2}
  end
end
