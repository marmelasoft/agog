defmodule AgogWeb.TeamLive.Index do
  use AgogWeb, :live_view

  alias Agog.Organizations
  alias Agog.Organizations.Team

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :teams, list_teams())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Team")
    |> assign(:team, Organizations.get_team!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Team")
    |> assign(:team, %Team{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Teams")
    |> assign(:team, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    team = Organizations.get_team!(id)
    {:ok, _} = Organizations.delete_team(team)

    {:noreply, assign(socket, :teams, list_teams())}
  end

  defp list_teams do
    Organizations.list_teams()
  end
end
