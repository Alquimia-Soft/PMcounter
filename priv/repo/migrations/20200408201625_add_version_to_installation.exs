defmodule PMCounter.Repo.Migrations.AddVersionToInstallation do
  use Ecto.Migration

  def change do
    alter table(:installations) do
      add :version, :string, null: false
    end

  end
end
