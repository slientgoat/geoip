defmodule GeoipWeb.PageController do
  use GeoipWeb, :controller

  def ip(conn, _params) do
    render conn, "index.html"
  end
end
