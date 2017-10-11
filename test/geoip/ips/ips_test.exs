defmodule Geoip.IpsTest do
  use Geoip.DataCase

  alias Geoip.Ips

  describe "ips" do
    alias Geoip.Ips.Ip

    @valid_attrs %{areacode: "some areacode", continent: "some continent", country: "some country", id: 42, maxip: 42, minip: 42, multiarea: []}
    @update_attrs %{areacode: "some updated areacode", continent: "some updated continent", country: "some updated country", id: 43, maxip: 43, minip: 43, multiarea: []}
    @invalid_attrs %{areacode: nil, continent: nil, country: nil, id: nil, maxip: nil, minip: nil, multiarea: nil}

    def ip_fixture(attrs \\ %{}) do
      {:ok, ip} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Ips.create_ip()

      ip
    end

    test "list_ips/0 returns all ips" do
      ip = ip_fixture()
      assert Ips.list_ips() == [ip]
    end

    test "get_ip!/1 returns the ip with given id" do
      ip = ip_fixture()
      assert Ips.get_ip!(ip.id) == ip
    end

    test "create_ip/1 with valid data creates a ip" do
      assert {:ok, %Ip{} = ip} = Ips.create_ip(@valid_attrs)
      assert ip.areacode == "some areacode"
      assert ip.continent == "some continent"
      assert ip.country == "some country"
      assert ip.id == 42
      assert ip.maxip == 42
      assert ip.minip == 42
      assert ip.multiarea == []
    end

    test "create_ip/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ips.create_ip(@invalid_attrs)
    end

    test "update_ip/2 with valid data updates the ip" do
      ip = ip_fixture()
      assert {:ok, ip} = Ips.update_ip(ip, @update_attrs)
      assert %Ip{} = ip
      assert ip.areacode == "some updated areacode"
      assert ip.continent == "some updated continent"
      assert ip.country == "some updated country"
      assert ip.id == 43
      assert ip.maxip == 43
      assert ip.minip == 43
      assert ip.multiarea == []
    end

    test "update_ip/2 with invalid data returns error changeset" do
      ip = ip_fixture()
      assert {:error, %Ecto.Changeset{}} = Ips.update_ip(ip, @invalid_attrs)
      assert ip == Ips.get_ip!(ip.id)
    end

    test "delete_ip/1 deletes the ip" do
      ip = ip_fixture()
      assert {:ok, %Ip{}} = Ips.delete_ip(ip)
      assert_raise Ecto.NoResultsError, fn -> Ips.get_ip!(ip.id) end
    end

    test "change_ip/1 returns a ip changeset" do
      ip = ip_fixture()
      assert %Ecto.Changeset{} = Ips.change_ip(ip)
    end
  end

  describe "ips" do
    alias Geoip.Ips.Ip

    @valid_attrs %{areacode: "some areacode", continent: "some continent", country: "some country", id: 42, maxip: 42, minip: 42, multiarea: [], user: "some user"}
    @update_attrs %{areacode: "some updated areacode", continent: "some updated continent", country: "some updated country", id: 43, maxip: 43, minip: 43, multiarea: [], user: "some updated user"}
    @invalid_attrs %{areacode: nil, continent: nil, country: nil, id: nil, maxip: nil, minip: nil, multiarea: nil, user: nil}

    def ip_fixture(attrs \\ %{}) do
      {:ok, ip} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Ips.create_ip()

      ip
    end

    test "list_ips/0 returns all ips" do
      ip = ip_fixture()
      assert Ips.list_ips() == [ip]
    end

    test "get_ip!/1 returns the ip with given id" do
      ip = ip_fixture()
      assert Ips.get_ip!(ip.id) == ip
    end

    test "create_ip/1 with valid data creates a ip" do
      assert {:ok, %Ip{} = ip} = Ips.create_ip(@valid_attrs)
      assert ip.areacode == "some areacode"
      assert ip.continent == "some continent"
      assert ip.country == "some country"
      assert ip.id == 42
      assert ip.maxip == 42
      assert ip.minip == 42
      assert ip.multiarea == []
      assert ip.user == "some user"
    end

    test "create_ip/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ips.create_ip(@invalid_attrs)
    end

    test "update_ip/2 with valid data updates the ip" do
      ip = ip_fixture()
      assert {:ok, ip} = Ips.update_ip(ip, @update_attrs)
      assert %Ip{} = ip
      assert ip.areacode == "some updated areacode"
      assert ip.continent == "some updated continent"
      assert ip.country == "some updated country"
      assert ip.id == 43
      assert ip.maxip == 43
      assert ip.minip == 43
      assert ip.multiarea == []
      assert ip.user == "some updated user"
    end

    test "update_ip/2 with invalid data returns error changeset" do
      ip = ip_fixture()
      assert {:error, %Ecto.Changeset{}} = Ips.update_ip(ip, @invalid_attrs)
      assert ip == Ips.get_ip!(ip.id)
    end

    test "delete_ip/1 deletes the ip" do
      ip = ip_fixture()
      assert {:ok, %Ip{}} = Ips.delete_ip(ip)
      assert_raise Ecto.NoResultsError, fn -> Ips.get_ip!(ip.id) end
    end

    test "change_ip/1 returns a ip changeset" do
      ip = ip_fixture()
      assert %Ecto.Changeset{} = Ips.change_ip(ip)
    end
  end
end
