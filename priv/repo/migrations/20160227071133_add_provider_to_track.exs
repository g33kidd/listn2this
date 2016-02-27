defmodule Listen.Repo.Migrations.AddProviderToTrack do
  use Ecto.Migration

  def change do
    alter table(:tracks) do
      add :provider, :text
    end
  end
end
