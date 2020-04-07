defmodule PMCounter.Repo do
  use Ecto.Repo,
    otp_app: :pmcounter,
    adapter: Ecto.Adapters.Postgres
end
