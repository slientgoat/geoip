defmodule Geoip.Ips do
  @moduledoc """
  The Ips context.
  """

  import Ecto.Query, warn: false
  alias Geoip.Repo

  alias Geoip.Ips.Ip

  @doc """
  Returns the list of ips.

  ## Examples

      iex> list_ips()
      [%Ip{}, ...]

  """
  def list_ips do
    Repo.all(Ip)
  end

  @doc """
  Gets a single ip.

  Raises `Ecto.NoResultsError` if the Ip does not exist.

  ## Examples

      iex> get_ip!("192.168.10.71")
      %Ip{}

  """
  def get_ip!(ip) when is_binary(ip), do: Geoip.ip_to_int(ip) |> get_ip!()
  def get_ip!(ip), do: Ip |> where([c], c.minip <= ^ip and c.maxip >= ^ip) |> order_by([c],[desc: c.minip]) |> limit(1) |> Repo.one

  @doc """
  Creates a ip.

  ## Examples

      iex> create_ip(%{field: value})
      {:ok, %Ip{}}

      iex> create_ip(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_ip(attrs \\ %{}) do
    %Ip{}
    |> Ip.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a ip.

  ## Examples

      iex> update_ip(ip, %{field: new_value})
      {:ok, %Ip{}}

      iex> update_ip(ip, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_ip(%Ip{} = ip, attrs) do
    ip
    |> Ip.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Ip.

  ## Examples

      iex> delete_ip(ip)
      {:ok, %Ip{}}

      iex> delete_ip(ip)
      {:error, %Ecto.Changeset{}}

  """
  def delete_ip(%Ip{} = ip) do
    Repo.delete(ip)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking ip changes.

  ## Examples

      iex> change_ip(ip)
      %Ecto.Changeset{source: %Ip{}}

  """
  def change_ip(%Ip{} = ip) do
    Ip.changeset(ip, %{})
  end
end
