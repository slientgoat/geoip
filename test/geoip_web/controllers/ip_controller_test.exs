defmodule GeoipWeb.IpControllerTest do
  use GeoipWeb.ConnCase

  alias Geoip.Ips
  alias Geoip.Ips.Ip

  @create_attrs %{areacode: "some areacode", continent: "some continent", country: "some country", id: 42, maxip: 42, minip: 42, multiarea: [], user: "some user"}
  @update_attrs %{areacode: "some updated areacode", continent: "some updated continent", country: "some updated country", id: 43, maxip: 43, minip: 43, multiarea: [], user: "some updated user"}
  @invalid_attrs %{areacode: nil, continent: nil, country: nil, id: nil, maxip: nil, minip: nil, multiarea: nil, user: nil}

  def fixture(:ip) do
    {:ok, ip} = Ips.create_ip(@create_attrs)
    ip
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all ips", %{conn: conn} do
      conn = get conn, ip_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create ip" do
    test "renders ip when data is valid", %{conn: conn} do
      conn = post conn, ip_path(conn, :create), ip: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, ip_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "areacode" => "some areacode",
        "continent" => "some continent",
        "country" => "some country",
        "id" => 42,
        "maxip" => 42,
        "minip" => 42,
        "multiarea" => [],
        "user" => "some user"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, ip_path(conn, :create), ip: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update ip" do
    setup [:create_ip]

    test "renders ip when data is valid", %{conn: conn, ip: %Ip{id: id} = ip} do
      conn = put conn, ip_path(conn, :update, ip), ip: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, ip_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "areacode" => "some updated areacode",
        "continent" => "some updated continent",
        "country" => "some updated country",
        "id" => 43,
        "maxip" => 43,
        "minip" => 43,
        "multiarea" => [],
        "user" => "some updated user"}
    end

    test "renders errors when data is invalid", %{conn: conn, ip: ip} do
      conn = put conn, ip_path(conn, :update, ip), ip: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete ip" do
    setup [:create_ip]

    test "deletes chosen ip", %{conn: conn, ip: ip} do
      conn = delete conn, ip_path(conn, :delete, ip)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, ip_path(conn, :show, ip)
      end
    end
  end

  defp create_ip(_) do
    ip = fixture(:ip)
    {:ok, ip: ip}
  end
end
