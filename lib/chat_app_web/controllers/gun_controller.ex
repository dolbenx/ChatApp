defmodule ChatAppWeb.GunController do
  use ChatAppWeb, :controller

  alias ChatApp.Security.Gun
  alias ChatApp.Gun
  alias ChatApp.Repo

  def index(conn, _params) do
    rooms = Talk.list_rooms()
    render(conn, "index.html", rooms: rooms)
  end

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, gun_params) do
    case Gun.create_gun(gun_params) do
      {:ok, _gun} ->
        conn
        |> put_flash(:info, "Gun Created!")
        |> redirect(to: Routes.gun_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    room = Talk.get_room!(id)
    render(conn, "show.html", room: room)
  end

  def edit(conn, %{"id" => id}) do
    room = Talk.get_room!(id)
    changeset = Talk.change_room(room)
    render(conn, "edit.html", room: room, changeset: changeset)
  end

  def update(conn, %{"id" => id, "room" => room_params}) do
    room = Talk.get_room!(id)

    case Talk.update_room(room, room_params) do
      {:ok, _} ->
        conn
          |> put_flash(:info, "Room updated!")
          |> redirect(to: Routes.room_path(conn, :show, room))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", room: room, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    room = Talk.get_room!(id)
    {:ok, _room} = Talk.delete_room(room)

    conn
      |> put_flash(:info, "Room Deleted")
      |> redirect(to: Routes.room_path(conn, :index))
  end
end
