defmodule GeoipWeb.IpController do
  use GeoipWeb, :controller

  alias Geoip.Ips
#  alias Geoip.Ips.Ip

  action_fallback GeoipWeb.FallbackController

  def show(conn, %{"val" => val}) do
    ip = Ips.get_ip!(val)
    render(conn, "show.json", ip: ip)
  end

end
