defmodule TesterWeb.ComeLive.Index do
  use TesterWeb, :live_view

  alias Tester.Comes
  alias Tester.Comes.Come

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :come_collection, list_come())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Come")
    |> assign(:come, Comes.get_come!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Come")
    |> assign(:come, %Come{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Come")
    |> assign(:come, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    come = Comes.get_come!(id)
    {:ok, _} = Comes.delete_come(come)

    {:noreply, assign(socket, :come_collection, list_come())}
  end

  defp list_come do
    Comes.list_come()
  end
end
