defmodule SitefinanceiroWeb.FinancialController do
  use SitefinanceiroWeb, :controller
  alias Sitefinanceiro.Contas

  def reports(conn, _params) do
    receitas = Contas.list_receitas(%{user_id: conn.assigns.current_user.id})
    despesas = Contas.list_despesas(%{user_id: conn.assigns.current_user.id})
    render(conn, "reports.html", receitas: receitas, despesas: despesas)
  end

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def index(conn, _params) do
    render(conn, "index.html")
  end

end
