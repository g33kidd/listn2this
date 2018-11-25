defmodule Listn.Repo do
  use Ecto.Repo,
    otp_app: :listn2this,
    adapter: Ecto.Adapters.Postgres
end
