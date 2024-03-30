defmodule Tester.ComesTest do
  use Tester.DataCase

  alias Tester.Comes

  describe "come" do
    alias Tester.Comes.Come

    import Tester.ComesFixtures

    @invalid_attrs %{description: nil, text: nil}

    test "list_come/0 returns all come" do
      come = come_fixture()
      assert Comes.list_come() == [come]
    end

    test "get_come!/1 returns the come with given id" do
      come = come_fixture()
      assert Comes.get_come!(come.id) == come
    end

    test "create_come/1 with valid data creates a come" do
      valid_attrs = %{description: "some description", text: "some text"}

      assert {:ok, %Come{} = come} = Comes.create_come(valid_attrs)
      assert come.description == "some description"
      assert come.text == "some text"
    end

    test "create_come/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Comes.create_come(@invalid_attrs)
    end

    test "update_come/2 with valid data updates the come" do
      come = come_fixture()
      update_attrs = %{description: "some updated description", text: "some updated text"}

      assert {:ok, %Come{} = come} = Comes.update_come(come, update_attrs)
      assert come.description == "some updated description"
      assert come.text == "some updated text"
    end

    test "update_come/2 with invalid data returns error changeset" do
      come = come_fixture()
      assert {:error, %Ecto.Changeset{}} = Comes.update_come(come, @invalid_attrs)
      assert come == Comes.get_come!(come.id)
    end

    test "delete_come/1 deletes the come" do
      come = come_fixture()
      assert {:ok, %Come{}} = Comes.delete_come(come)
      assert_raise Ecto.NoResultsError, fn -> Comes.get_come!(come.id) end
    end

    test "change_come/1 returns a come changeset" do
      come = come_fixture()
      assert %Ecto.Changeset{} = Comes.change_come(come)
    end
  end
end
