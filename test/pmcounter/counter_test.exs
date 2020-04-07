defmodule PMCounter.CounterTest do
  use PMCounter.DataCase

  alias PMCounter.Counter

  describe "installations" do
    alias PMCounter.Counter.Installation

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def installation_fixture(attrs \\ %{}) do
      {:ok, installation} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Counter.create_installation()

      installation
    end

    test "list_installations/0 returns all installations" do
      installation = installation_fixture()
      assert Counter.list_installations() == [installation]
    end

    test "get_installation!/1 returns the installation with given id" do
      installation = installation_fixture()
      assert Counter.get_installation!(installation.id) == installation
    end

    test "create_installation/1 with valid data creates a installation" do
      assert {:ok, %Installation{} = installation} = Counter.create_installation(@valid_attrs)
    end

    test "create_installation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Counter.create_installation(@invalid_attrs)
    end

    test "update_installation/2 with valid data updates the installation" do
      installation = installation_fixture()

      assert {:ok, %Installation{} = installation} =
               Counter.update_installation(installation, @update_attrs)
    end

    test "update_installation/2 with invalid data returns error changeset" do
      installation = installation_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Counter.update_installation(installation, @invalid_attrs)

      assert installation == Counter.get_installation!(installation.id)
    end

    test "delete_installation/1 deletes the installation" do
      installation = installation_fixture()
      assert {:ok, %Installation{}} = Counter.delete_installation(installation)
      assert_raise Ecto.NoResultsError, fn -> Counter.get_installation!(installation.id) end
    end

    test "change_installation/1 returns a installation changeset" do
      installation = installation_fixture()
      assert %Ecto.Changeset{} = Counter.change_installation(installation)
    end
  end
end
