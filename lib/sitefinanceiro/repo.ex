defmodule Sitefinanceiro.Repo do
  use Ecto.Repo,
    otp_app: :sitefinanceiro,
    adapter: Ecto.Adapters.Postgres
end
