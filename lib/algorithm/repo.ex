defmodule Algorithm.Repo do
  use Ecto.Repo,
    otp_app: :algorithm,
    adapter: Ecto.Adapters.Postgres
end
