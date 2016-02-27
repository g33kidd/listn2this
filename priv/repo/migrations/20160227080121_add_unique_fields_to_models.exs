defmodule Listen.Repo.Migrations.AddUniqueFieldsToModels do
  use Ecto.Migration

  def change do
    create unique_index(:users, [:username])
    create unique_index(:tracks, [:link])
  end
end
