defmodule Tester.Comes.Come do
  use Ecto.Schema
  import Ecto.Changeset

  schema "come" do
    field :description, :string
    field :text, :string

    timestamps()
  end

  @doc false
  def changeset(come, attrs) do
    come
    |> cast(attrs, [:text, :description])
    |> validate_required([:text, :description])
  end
end
