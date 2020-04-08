defmodule PMCounter.CounterTest do
  use PMCounter.DataCase

  alias PMCounter.Counter

  describe "installations" do
    alias PMCounter.Counter.Installation

    @valid_attrs %{version: "v0.7.10"}
    @update_attrs %{version: "v1.30.2"}
    @invalid_attrs %{version: "1.2.0"}

    def installation_fixture(attrs \\ %{}) do
      {:ok, installation} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Counter.create_installation()

      installation
    end

    # test "list_installations/0 returns all installations" do
    #   installation = installation_fixture()
    #   assert Counter.list_installations() == [installation]
    # end

    # test "get_installation!/1 returns the installation with given id" do
    #   installation = installation_fixture()
    #   assert Counter.get_installation!(installation.id) == installation
    # end

    test "count_installations/0 counts the number of installations" do
      assert %{} == Counter.count_installations()
      installation_fixture(%{version: "v1.9.1"})
      assert %{"v1.9.1" => 1} == Counter.count_installations()
      installation_fixture(%{version: "v1.9.1"})
      assert %{"v1.9.1" => 2} == Counter.count_installations()
      installation_fixture(%{version: "v1.9.2"})
      assert %{"v1.9.1" => 2, "v1.9.2" => 1} == Counter.count_installations()
      installation_fixture(%{version: "v1.9.2"})
      assert %{"v1.9.1" => 2, "v1.9.2" => 2} == Counter.count_installations()
    end

    test "create_installation/1 with valid data creates a installation" do
      assert {:ok, %Installation{} = installation} = Counter.create_installation(@valid_attrs)
    end

    test "create_installation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Counter.create_installation(@invalid_attrs)
    end

    # test "update_installation/2 with valid data updates the installation" do
    #   installation = installation_fixture()

    #   assert {:ok, %Installation{} = installation} =
    #            Counter.update_installation(installation, @update_attrs)
    # end

    # test "update_installation/2 with invalid data returns error changeset" do
    #   installation = installation_fixture()

    #   assert {:error, %Ecto.Changeset{}} =
    #            Counter.update_installation(installation, @invalid_attrs)

    #   assert installation == Counter.get_installation!(installation.id)
    # end

    # test "delete_installation/1 deletes the installation" do
    #   installation = installation_fixture()
    #   assert {:ok, %Installation{}} = Counter.delete_installation(installation)
    #   assert_raise Ecto.NoResultsError, fn -> Counter.get_installation!(installation.id) end
    # end

    test "change_installation/1 returns a installation changeset" do
      installation = installation_fixture()
      assert %Ecto.Changeset{} = Counter.change_installation(installation)
    end
  end
end
