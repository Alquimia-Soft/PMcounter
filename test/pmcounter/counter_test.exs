defmodule PMCounter.CounterTest do
  use PMCounter.DataCase

  alias PMCounter.Counter

  describe "installations" do
    alias PMCounter.Counter.Installatio

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def installatio_fixture(attrs \\ %{}) do
      {:ok, installatio} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Counter.create_installatio()

      installatio
    end

    test "list_installations/0 returns all installations" do
      installatio = installatio_fixture()
      assert Counter.list_installations() == [installatio]
    end

    test "get_installatio!/1 returns the installatio with given id" do
      installatio = installatio_fixture()
      assert Counter.get_installatio!(installatio.id) == installatio
    end

    test "create_installatio/1 with valid data creates a installatio" do
      assert {:ok, %Installatio{} = installatio} = Counter.create_installatio(@valid_attrs)
    end

    test "create_installatio/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Counter.create_installatio(@invalid_attrs)
    end

    test "update_installatio/2 with valid data updates the installatio" do
      installatio = installatio_fixture()
      assert {:ok, %Installatio{} = installatio} = Counter.update_installatio(installatio, @update_attrs)
    end

    test "update_installatio/2 with invalid data returns error changeset" do
      installatio = installatio_fixture()
      assert {:error, %Ecto.Changeset{}} = Counter.update_installatio(installatio, @invalid_attrs)
      assert installatio == Counter.get_installatio!(installatio.id)
    end

    test "delete_installatio/1 deletes the installatio" do
      installatio = installatio_fixture()
      assert {:ok, %Installatio{}} = Counter.delete_installatio(installatio)
      assert_raise Ecto.NoResultsError, fn -> Counter.get_installatio!(installatio.id) end
    end

    test "change_installatio/1 returns a installatio changeset" do
      installatio = installatio_fixture()
      assert %Ecto.Changeset{} = Counter.change_installatio(installatio)
    end
  end
end
