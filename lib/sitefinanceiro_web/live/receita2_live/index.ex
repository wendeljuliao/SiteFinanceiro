defmodule SitefinanceiroWeb.Receita2Live.Index do
  use SitefinanceiroWeb, :live_view

  alias Sitefinanceiro.Timeline
  alias Sitefinanceiro.Timeline.Receita2

  @impl true
  def mount(_params, session, socket) do
    if connected?(socket), do: Timeline.subscribe()

    user = Sitefinanceiro.Accounts.get_user_by_session_token(session["user_token"])
    #IO.inspect(user.id)
    {:ok, assign(socket, receitas2: list_receitas2(user.id), user: user), temporary_assigns: [receitas2: []]}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Receita2")
    |> assign(:receita2, Timeline.get_receita2!(id))
    |> assign(:user, socket.assigns.user)
  end

  defp apply_action(socket, :new, _params) do
    IO.inspect(socket.assigns.user)
    
    socket
    |> assign(:page_title, "New Receita2")
    |> assign(:receita2, %Receita2{})
    |> assign(:user, socket.assigns.user)
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Receitas2")
    |> assign(:receita2, nil)
    |> assign(:user, socket.assigns.user)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    receita2 = Timeline.get_receita2!(id)
    {:ok, _} = Timeline.delete_receita2(receita2)

    {:noreply, assign(socket, :receitas2, list_receitas2(socket.assigns.user.id))}
  end

  @impl true
  def handle_info({:receita2_created, receita2}, socket) do
    IO.inspect("oi2")
    IO.inspect(socket.assigns.user)
    {:noreply, update(socket, :receitas2, fn receitas2 -> [receita2 | receitas2] end)}
  end

  def handle_info({:receita2_updated, receita2}, socket) do
    {:noreply, update(socket, :receitas2, fn receitas2 -> [receita2 | receitas2] end)}
  end

  defp list_receitas2(id) do
    Timeline.list_receitas2(id)
  end
end
