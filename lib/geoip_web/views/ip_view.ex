defmodule GeoipWeb.IpView do
  use GeoipWeb, :view
  alias GeoipWeb.IpView

  def render("index.json", %{ips: ips}) do
    %{data: render_many(ips, IpView, "ip.json")}
  end

  def render("show.json", %{ip: ip}) do
    %{data: render_one(ip, IpView, "ip.json")}
  end

  def render("ip.json", %{ip: ip}) do
    %{
      id: ip.id,
      minip: ip.minip,
      maxip: ip.maxip,
      continent: ip.continent,
      areacode: ip.areacode,
      country: ip.country,
      multiarea: ip.multiarea,
      user: ip.user}
  end
end
