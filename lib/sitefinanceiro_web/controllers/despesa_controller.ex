defmodule SitefinanceiroWeb.DespesaController do
  use SitefinanceiroWeb, :controller

  alias Sitefinanceiro.Contas
  alias Sitefinanceiro.Contas.Despesa

  def index(conn, _params) do

    despesas = Contas.list_despesas(%{user_id: conn.assigns.current_user.id})
    render(conn, "index.html", despesas: despesas)
  end

  def new(conn, _params) do
    changeset = Contas.change_despesa(%Despesa{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"despesa" => despesa_params}) do
    IO.inspect(conn.assigns.current_user.id )
    aux_despesa_params = %{description: despesa_params["description"], value: despesa_params["value"], user_id: conn.assigns.current_user.id}
    case Contas.create_despesa(aux_despesa_params) do
      {:ok, despesa} ->
        conn
        |> put_flash(:info, "Despesa created successfully.")
        |> redirect(to: Routes.despesa_path(conn, :show, despesa))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    despesa = Contas.get_despesa!(id)
    render(conn, "show.html", despesa: despesa)
  end

  def edit(conn, %{"id" => id}) do
    despesa = Contas.get_despesa!(id)
    changeset = Contas.change_despesa(despesa)
    render(conn, "edit.html", despesa: despesa, changeset: changeset)
  end

  def update(conn, %{"id" => id, "despesa" => despesa_params}) do
    despesa = Contas.get_despesa!(id)

    case Contas.update_despesa(despesa, despesa_params) do
      {:ok, despesa} ->
        conn
        |> put_flash(:info, "Despesa updated successfully.")
        |> redirect(to: Routes.despesa_path(conn, :show, despesa))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", despesa: despesa, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    despesa = Contas.get_despesa!(id)
    {:ok, _despesa} = Contas.delete_despesa(despesa)

    conn
    |> put_flash(:info, "Despesa deleted successfully.")
    |> redirect(to: Routes.despesa_path(conn, :index))
  end
end
