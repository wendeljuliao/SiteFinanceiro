defmodule SitefinanceiroWeb.Despesa2Live.Index do
  use SitefinanceiroWeb, :live_view

  alias Sitefinanceiro.Timeline2
  alias Sitefinanceiro.Timeline2.Despesa2

  @impl true
  def mount(_params, session, socket) do
    if connected?(socket), do: Timeline2.subscribe()

    user = Sitefinanceiro.Accounts.get_user_by_session_token(session["user_token"])
    #IO.inspect(user.id)
    {:ok, assign(socket, despesas2: list_despesas2(user.id), user: user), temporary_assigns: [despesas2: []]}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Despesa2")
    |> assign(:despesa2, Timeline2.get_despesa2!(id))
    |> assign(:user, socket.assigns.user)
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Despesa2")
    |> assign(:despesa2, %Despesa2{})
    |> assign(:user, socket.assigns.user)
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Despesas2")
    |> assign(:despesa2, nil)
    |> assign(:user, socket.assigns.user)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    despesa2 = Timeline2.get_despesa2!(id)
    {:ok, _} = Timeline2.delete_despesa2(despesa2)

    {:noreply, assign(socket, :despesas2, list_despesas2(socket.assigns.user.id))}
  end

  @impl true
  def handle_info({:despesa2_created, despesa2}, socket) do
    IO.inspect("oi2")
    IO.inspect(socket.assigns.user)
    {:noreply, update(socket, :despesas2, fn despesas2 -> [despesa2 | despesas2] end)}
  end

  def handle_info({:despesa2_updated, despesa2}, socket) do
    {:noreply, update(socket, :despesas2, fn despesas2 -> [despesa2 | despesas2] end)}
  end

  defp list_despesas2(id) do
    Timeline2.list_despesas2(id)
  end
end
