defmodule PMCounter.Repo.Migrations.CreateInstallations do
  use Ecto.Migration

  def change do
    create table(:installations, primary_key: false) do
      add :id, :binary_id, primary_key: true

      timestamps()
    end

  end
end
