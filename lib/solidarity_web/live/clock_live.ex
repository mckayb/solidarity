defmodule SolidarityWeb.ClockLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <div>
      <h2>It's <%=@date%></h2>
      <div>
        <button phx-click="click-foo">Click me!</button>
        <p>Come on now: <%=@foo%></p>
        <form phx-submit="send-chat">
          <input type="text" name="text"/>
          <button type="submit">Submit me!</button>
        </form>
        <div class="messages">
          <%= for message <- @messages do %>
            <p><%= message %></p>
          <% end %>
        </div>
      </div>
    </div>
    """
  end

  def mount(_session, socket) do
    if connected?(socket) do
      :timer.send_interval(1000, self(), :tick)
    end

    {:ok, initialize(socket)}
  end

  defp initialize(socket) do
    assign(socket, %{
      messages: [],
      date: :os.system_time(),
      foo: "Bar"
    })
  end

  def handle_info(:tick, socket) do
    {:noreply, assign(socket, %{
      date: :os.system_time()
    })}
  end

  def handle_event("nav", _path, socket) do
    {:noreply, socket}
  end

  def handle_event("click-foo", _path, socket) do
    {:noreply, assign(socket, %{
      foo: case socket.assigns.foo do
        "Foo" -> "Bar"
        "Bar" -> "Foo"
      end
    })}
  end

  def handle_event("send-chat", input, socket) do
    {:noreply, assign(socket, %{
      messages: socket.assigns.messages ++ [input["text"]]
    })}
  end
end
