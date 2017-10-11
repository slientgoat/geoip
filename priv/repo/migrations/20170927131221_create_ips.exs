defmodule Geoip.Repo.Migrations.CreateIps do
  use Ecto.Migration

  def change do
    create table(:ips,primary_key: false) do
      add :id, :bigint, primary_key: true
      add :minip, :bigint
      add :maxip, :bigint
      add :continent, :string
      add :areacode, :string
      add :country, :string
      add :multiarea, {:array, :map}
      add :user, :string
    end

  end
end
