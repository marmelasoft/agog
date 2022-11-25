defmodule Agog.Organizations.Team do
  use Ecto.Schema
  import Ecto.Changeset

  schema "teams" do
    field :handler, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:handler, :name])
    |> validate_required([:handler, :name])
  end
end
