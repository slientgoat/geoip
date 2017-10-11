defmodule Geoip do
  @moduledoc """
  Geoip keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  use Bitwise
  
  @doc """
    ip转int
  """
  def ip_to_int({a,b,c,d}),do: (a*16777216)+(b*65536)+(c*256)+(d)
  def ip_to_int(var),do: String.split(var,".") |> Enum.map(&String.to_integer/1)|> List.to_tuple() |> ip_to_int()

  @doc """
    int转ip
  """
  def int_to_ip(var),do: int_to_ip(var,:string)
  def int_to_ip(var,:tuple),do: {bsr(var,24), bsr(band(var,16711680),16), bsr(band(var,65280),8), band(var,255)}
  def int_to_ip(var,:string),do: int_to_ip(var,:tuple) |> Tuple.to_list() |> Enum.join(".")
end
