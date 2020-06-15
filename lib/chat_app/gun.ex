defmodule ChatApp.Gun do
  alias ChatApp.Repo
  alias ChatApp.Security.Gun

  def create_gun(attrs \\ %{}) do
    %Gun{}
    |> Gun.changeset(attrs)
    |> Gun.insert()
  end
end
