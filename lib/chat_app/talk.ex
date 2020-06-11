defmodule ChatApp.Talk do
  alias ChatApp.Repo
  alias ChatApp.Talk.Room

  def list_room do
    Repo.all(Room)
  end
end
