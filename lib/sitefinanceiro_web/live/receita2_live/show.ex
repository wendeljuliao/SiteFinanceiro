defmodule SitefinanceiroWeb.Receita2Live.Show do
  use SitefinanceiroWeb, :live_view

  alias Sitefinanceiro.Timeline

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:receita2, Timeline.get_receita2!(id))}
  end

  defp page_title(:show), do: "Show Receita2"
  defp page_title(:edit), do: "Edit Receita2"
end
