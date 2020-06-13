defmodule ChatApp.Repo.Migrations.CreateTblGuns do
  use Ecto.Migration

  def change do
    create table(:tbl_guns) do
      add :name, :string
      add :type, :string
      add :gun_code, :string
      add :status, :string

      timestamps()
    end

  end
end
