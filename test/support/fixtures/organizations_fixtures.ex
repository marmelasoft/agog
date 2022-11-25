defmodule Agog.OrganizationsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Agog.Organizations` context.
  """

  @doc """
  Generate a team.
  """
  def team_fixture(attrs \\ %{}) do
    {:ok, team} =
      attrs
      |> Enum.into(%{
        handler: "some handler",
        name: "some name"
      })
      |> Agog.Organizations.create_team()

    team
  end
end
