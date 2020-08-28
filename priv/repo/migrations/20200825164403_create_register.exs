defmodule PMCounter.Repo.Migrations.CreateRegister do
  use Ecto.Migration

  def change do
    create table(:registers, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :input, :text, null: false
      add :output, :text, null: false
      add :installation_code, :binary_id
      add :run_number, :integer

      timestamps()
    end
  end
end
