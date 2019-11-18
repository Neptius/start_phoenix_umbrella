defmodule NovyWeb.VideoLive.Index do
  use Phoenix.LiveView

  alias Novy.Multimedia
  alias Novy.Multimedia.Video
  
  def render(assigns) do
    ~L"""
    <h1>Listing Videos</h1>

    <table>
      <thead>
        <tr>
          <th>Title</th>
          <th></th>
          <th></th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        <%= for video <- @videos do %>
          <tr>
            <td><%= video.title %></td>
          </tr>
        <% end %>
      </tbody>
    </table>
    """
  end

  def mount(%{user_id: user_id}, socket) do
    videos = Multimedia.list_user_videos(user_id)
    socket =
      socket
      |> assign(:videos, videos)
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
