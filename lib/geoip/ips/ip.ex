defmodule Geoip.Ips.Ip do
  use Ecto.Schema
  import Ecto.Changeset
  alias Geoip.Ips.Ip

  @primary_key {:id, :integer, []}
  schema "ips" do
    field :areacode, :string
    field :continent, :string
    field :country, :string
    field :maxip, :integer
    field :minip, :integer
    field :multiarea, {:array, :map}
    field :user, :string
  end

  @doc false
  def changeset(%Ip{} = ip, attrs) do
    ip
    |> cast(attrs, [:id, :minip, :maxip, :continent, :areacode, :country, :multiarea, :user])
    |> validate_required([:id, :minip, :maxip, :continent, :areacode, :country, :multiarea, :user])
  end
end
