defmodule TesterWeb.ComeLive.FormComponent do
  use TesterWeb, :live_component

  alias Tester.Comes

  @impl true
  def update(%{come: come} = assigns, socket) do
    changeset = Comes.change_come(come)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"come" => come_params}, socket) do
    changeset =
      socket.assigns.come
      |> Comes.change_come(come_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"come" => come_params}, socket) do
    save_come(socket, socket.assigns.action, come_params)
  end

  defp save_come(socket, :edit, come_params) do
    case Comes.update_come(socket.assigns.come, come_params) do
      {:ok, _come} ->
        {:noreply,
         socket
         |> put_flash(:info, "Come updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_come(socket, :new, come_params) do
    case Comes.create_come(come_params) do
      {:ok, _come} ->
        {:noreply,
         socket
         |> put_flash(:info, "Come created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
