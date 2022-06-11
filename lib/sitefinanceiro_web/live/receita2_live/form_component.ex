defmodule SitefinanceiroWeb.Receita2Live.FormComponent do
  use SitefinanceiroWeb, :live_component

  alias Sitefinanceiro.Timeline

  @impl true
  def update(%{receita2: receita2} = assigns, socket) do
    changeset = Timeline.change_receita2(receita2)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"receita2" => receita2_params}, socket) do
    changeset =
      socket.assigns.receita2
      |> Timeline.change_receita2(receita2_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"receita2" => receita2_params}, socket) do
    aux_receita2_params = %{description: receita2_params["description"], value: receita2_params["value"], user_id: socket.assigns.idAux}

    save_receita2(socket, socket.assigns.action, aux_receita2_params)
  end

  defp save_receita2(socket, :edit, receita2_params) do
    case Timeline.update_receita2(socket.assigns.receita2, receita2_params) do
      {:ok, _receita2} ->
        {:noreply,
         socket
         |> put_flash(:info, "Receita2 updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_receita2(socket, :new, receita2_params) do
    case Timeline.create_receita2(receita2_params) do
      {:ok, _receita2} ->
        {:noreply,
         socket
         |> put_flash(:info, "Receita2 created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
