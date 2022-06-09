defmodule SitefinanceiroWeb.ReceitaController do
  use SitefinanceiroWeb, :controller

  alias Sitefinanceiro.Contas
  alias Sitefinanceiro.Contas.Receita

  def index(conn, _params) do
    receitas = Contas.list_receitas()
    render(conn, "index.html", receitas: receitas)
  end

  def new(conn, _params) do
    changeset = Contas.change_receita(%Receita{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"receita" => receita_params}) do
    case Contas.create_receita(receita_params) do
      {:ok, receita} ->
        conn
        |> put_flash(:info, "Receita created successfully.")
        |> redirect(to: Routes.receita_path(conn, :show, receita))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    receita = Contas.get_receita!(id)
    render(conn, "show.html", receita: receita)
  end

  def edit(conn, %{"id" => id}) do
    receita = Contas.get_receita!(id)
    changeset = Contas.change_receita(receita)
    render(conn, "edit.html", receita: receita, changeset: changeset)
  end

  def update(conn, %{"id" => id, "receita" => receita_params}) do
    receita = Contas.get_receita!(id)

    case Contas.update_receita(receita, receita_params) do
      {:ok, receita} ->
        conn
        |> put_flash(:info, "Receita updated successfully.")
        |> redirect(to: Routes.receita_path(conn, :show, receita))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", receita: receita, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    receita = Contas.get_receita!(id)
    {:ok, _receita} = Contas.delete_receita(receita)

    conn
    |> put_flash(:info, "Receita deleted successfully.")
    |> redirect(to: Routes.receita_path(conn, :index))
  end
end
