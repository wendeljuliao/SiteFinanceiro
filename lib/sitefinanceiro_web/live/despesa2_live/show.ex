defmodule SitefinanceiroWeb.Despesa2Live.Show do
  use SitefinanceiroWeb, :live_view

  alias Sitefinanceiro.Timeline2

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:despesa2, Timeline2.get_despesa2!(id))}
  end

  defp page_title(:show), do: "Show Despesa2"
  defp page_title(:edit), do: "Edit Despesa2"
end
