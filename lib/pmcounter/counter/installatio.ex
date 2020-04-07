defmodule PMCounter.Counter.Installatio do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "installations" do

    timestamps()
  end

  @doc false
  def changeset(installatio, attrs) do
    installatio
    |> cast(attrs, [])
    |> validate_required([])
  end
end
