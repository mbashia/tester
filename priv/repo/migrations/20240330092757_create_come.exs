defmodule Tester.Repo.Migrations.CreateCome do
  use Ecto.Migration

  def change do
    create table(:come) do
      add :text, :string
      add :description, :string

      timestamps()
    end
  end
end
