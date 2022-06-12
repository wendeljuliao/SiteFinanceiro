defmodule SitefinanceiroWeb.FinancialView do
  use SitefinanceiroWeb, :view

  def fetch_chart_data(contas) do
    IO.inspect(contas)
    Enum.map(Enum.take(Enum.sort_by(contas, &(&1.value), :desc), 5), & &1.value)
  end

  def fetch_chart_labels(contas) do
    Enum.map(Enum.take(Enum.sort_by(contas, &(&1.value), :desc), 5), & &1.inserted_at)
  end

end
