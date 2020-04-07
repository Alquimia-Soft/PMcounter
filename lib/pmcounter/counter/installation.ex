defmodule PMCounter.Counter.Installation do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "installations" do

    timestamps()
  end

  @doc false
  def changeset(installation, attrs) do
    installation
    |> cast(attrs, [])
    |> validate_required([])
  end
end
