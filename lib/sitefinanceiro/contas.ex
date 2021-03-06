defmodule Sitefinanceiro.Contas do
  @moduledoc """
  The Contas context.
  """

  import Ecto.Query, warn: false
  alias Sitefinanceiro.Repo

  alias Sitefinanceiro.Contas.Receita
  alias Sitefinanceiro.Contas.Despesa

  @doc """
  Returns the list of receitas.

  ## Examples

      iex> list_receitas()
      [%Receita{}, ...]

  """
  def list_receitas(attrs) do
    IO.inspect(attrs.user_id)
    query = from(Receita, where: [user_id: ^attrs.user_id])
    Repo.all(query)
  end

  def list_despesas(attrs) do
    IO.inspect(attrs.user_id)
    query = from(Despesa, where: [user_id: ^attrs.user_id])
    Repo.all(query)
  end

  @doc """
  Gets a single receita.

  Raises `Ecto.NoResultsError` if the Receita does not exist.

  ## Examples

      iex> get_receita!(123)
      %Receita{}

      iex> get_receita!(456)
      ** (Ecto.NoResultsError)

  """
  def get_receita!(id), do: Repo.get!(Receita, id)
  def get_despesa!(id), do: Repo.get!(Despesa, id)

  @doc """
  Creates a receita.

  ## Examples

      iex> create_receita(%{field: value})
      {:ok, %Receita{}}

      iex> create_receita(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_receita(attrs \\ %{}) do
    IO.inspect("Oi")
    IO.inspect(attrs)
    %Receita{}
    |> Receita.changeset(attrs)
    |> Repo.insert()
  end

  def create_despesa(attrs \\ %{}) do
    IO.inspect("Oi")
    IO.inspect(attrs)
    %Despesa{}
    |> Despesa.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a receita.

  ## Examples

      iex> update_receita(receita, %{field: new_value})
      {:ok, %Receita{}}

      iex> update_receita(receita, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_receita(%Receita{} = receita, attrs) do
    receita
    |> Receita.changeset(attrs)
    |> Repo.update()
  end

  def update_despesa(%Despesa{} = despesa, attrs) do
    despesa
    |> Despesa.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a receita.

  ## Examples

      iex> delete_receita(receita)
      {:ok, %Receita{}}

      iex> delete_receita(receita)
      {:error, %Ecto.Changeset{}}

  """
  def delete_receita(%Receita{} = receita) do
    Repo.delete(receita)
  end

  def delete_despesa(%Despesa{} = despesa) do
    Repo.delete(despesa)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking receita changes.

  ## Examples

      iex> change_receita(receita)
      %Ecto.Changeset{data: %Receita{}}

  """
  def change_receita(%Receita{} = receita, attrs \\ %{}) do
    Receita.changeset(receita, attrs)
  end

  def change_despesa(%Despesa{} = despesa, attrs \\ %{}) do
    Despesa.changeset(despesa, attrs)
  end

end
