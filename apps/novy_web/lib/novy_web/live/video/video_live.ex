defmodule NovyWeb.VideoLive.Index do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <label>Counter: <%= @counter %></label>
    <button phx-click="incr">+</button>
    <button phx-click="decr">-</button>
    """
  end

  def mount(_session, socket) do
    socket =
      socket
      |> assign(:counter, 0)
      |> IO.inspect()

    {:ok, socket}
  end

  def handle_event("incr", _event, socket) do
    socket = update(socket, :counter, &(&1 + 1))
    {:noreply, socket}
  end

  def handle_event("decr", _event, socket) do
    socket = update(socket, :counter, &(&1 - 1))
    {:noreply, socket}
  end
end
