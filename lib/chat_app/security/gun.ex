defmodule ChatApp.Security.Gun do
  use Ecto.Schema
  import Ecto.Changeset
  alias ChatApp.Security.Gun

  schema "tbl_guns" do
    field :gun_code, :integer
    field :name, :string
    field :status, :string
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(gun, attrs) do
    gun
    |> cast(attrs, [:name, :type, :gun_code, :status])
    |> validate_required([:name, :type, :gun_code, :status])
  end
end
