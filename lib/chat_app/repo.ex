defmodule ChatApp.Repo do
  use Ecto.Repo,
    otp_app: :chat_app,
    adapter: Tds.Ecto
    # adapter: Ecto.Adapters.Postgres
end
