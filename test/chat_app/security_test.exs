defmodule ChatApp.SecurityTest do
  use ChatApp.DataCase

  alias ChatApp.Security

  describe "tbl_guns" do
    alias ChatApp.Security.Guns

    @valid_attrs %{gun_code: "some gun_code", name: "some name", status: "some status", type: "some type"}
    @update_attrs %{gun_code: "some updated gun_code", name: "some updated name", status: "some updated status", type: "some updated type"}
    @invalid_attrs %{gun_code: nil, name: nil, status: nil, type: nil}

    def guns_fixture(attrs \\ %{}) do
      {:ok, guns} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Security.create_guns()

      guns
    end

    test "list_tbl_guns/0 returns all tbl_guns" do
      guns = guns_fixture()
      assert Security.list_tbl_guns() == [guns]
    end

    test "get_guns!/1 returns the guns with given id" do
      guns = guns_fixture()
      assert Security.get_guns!(guns.id) == guns
    end

    test "create_guns/1 with valid data creates a guns" do
      assert {:ok, %Guns{} = guns} = Security.create_guns(@valid_attrs)
      assert guns.gun_code == "some gun_code"
      assert guns.name == "some name"
      assert guns.status == "some status"
      assert guns.type == "some type"
    end

    test "create_guns/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Security.create_guns(@invalid_attrs)
    end

    test "update_guns/2 with valid data updates the guns" do
      guns = guns_fixture()
      assert {:ok, %Guns{} = guns} = Security.update_guns(guns, @update_attrs)
      assert guns.gun_code == "some updated gun_code"
      assert guns.name == "some updated name"
      assert guns.status == "some updated status"
      assert guns.type == "some updated type"
    end

    test "update_guns/2 with invalid data returns error changeset" do
      guns = guns_fixture()
      assert {:error, %Ecto.Changeset{}} = Security.update_guns(guns, @invalid_attrs)
      assert guns == Security.get_guns!(guns.id)
    end

    test "delete_guns/1 deletes the guns" do
      guns = guns_fixture()
      assert {:ok, %Guns{}} = Security.delete_guns(guns)
      assert_raise Ecto.NoResultsError, fn -> Security.get_guns!(guns.id) end
    end

    test "change_guns/1 returns a guns changeset" do
      guns = guns_fixture()
      assert %Ecto.Changeset{} = Security.change_guns(guns)
    end
  end
end
