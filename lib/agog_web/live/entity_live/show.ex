defmodule AgogWeb.EntityLive.Show do
  use AgogWeb, :live_view

  alias Agog.Accounts
  alias Agog.Organizations

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"handler" => handler}, _, socket) do
    cond do
      Accounts.user_handler_exists?(handler) ->
        user = Accounts.get_user_by_handler(handler)
        {:noreply,
          socket
          |> assign(:page, :user)
          |> assign(:page_title, user.name)
          |> assign(:user, user)}

      Organizations.team_handler_exists?(handler) ->
        team = Organizations.get_team_by_handler(handler)
        {:noreply,
          socket
          |> assign(:page, :team)
          |> assign(:page_title, team.name)
          |> assign(:team, team)}
    end
  end

end
