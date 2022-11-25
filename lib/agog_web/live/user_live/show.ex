defmodule AgogWeb.UserLive.Show do
  use AgogWeb, :live_view

  alias Agog.Accounts

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"handler" => handler}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:user, Accounts.get_user_by_handler(handler))}
  end

  defp page_title(:show), do: "Show User"
end
