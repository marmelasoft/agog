defmodule Agog.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table(:teams) do
      add :handler, :string
      add :name, :string

      timestamps()
    end
  end
end
