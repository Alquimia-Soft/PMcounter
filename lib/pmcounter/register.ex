defmodule PMCounter.Register do
  use Ecto.Schema
  import Ecto.Changeset
  alias __MODULE__
  alias PMCounter.Repo

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "registers" do
    field :input, :string
    field :output, :string
    field :installation_code, :binary_id
    field :run_number, :integer

    timestamps()
  end

  @doc false
  def changeset(register, attrs) do
    register
    |> cast(attrs, [:input, :output, :installation_code, :run_number])
    |> validate_required([:input, :output, :installation_code, :run_number])
  end

  def create(attrs \\ %{}) do
    %Register{}
    |> Register.changeset(attrs)
    |> Repo.insert()
  end
end
