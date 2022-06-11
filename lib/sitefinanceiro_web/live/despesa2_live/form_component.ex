defmodule SitefinanceiroWeb.Despesa2Live.FormComponent do
  use SitefinanceiroWeb, :live_component

  alias Sitefinanceiro.Timeline2

  @impl true
  def update(%{despesa2: despesa2} = assigns, socket) do
    changeset = Timeline2.change_despesa2(despesa2)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"despesa2" => despesa2_params}, socket) do
    changeset =
      socket.assigns.despesa2
      |> Timeline2.change_despesa2(despesa2_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"despesa2" => despesa2_params}, socket) do
    aux_despesa2_params = %{description: despesa2_params["description"], value: despesa2_params["value"], user_id: socket.assigns.idAux}
    
    save_despesa2(socket, socket.assigns.action, aux_despesa2_params)
  end

  defp save_despesa2(socket, :edit, despesa2_params) do
    case Timeline2.update_despesa2(socket.assigns.despesa2, despesa2_params) do
      {:ok, _despesa2} ->
        {:noreply,
         socket
         |> put_flash(:info, "Despesa2 updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_despesa2(socket, :new, despesa2_params) do
    case Timeline2.create_despesa2(despesa2_params) do
      {:ok, _despesa2} ->
        {:noreply,
         socket
         |> put_flash(:info, "Despesa2 created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
