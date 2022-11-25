defmodule Agog.Repo do
  use Ecto.Repo,
    otp_app: :agog,
    adapter: Ecto.Adapters.Postgres
end
