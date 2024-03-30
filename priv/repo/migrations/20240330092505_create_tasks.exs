defmodule Tester.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :text, :string
      add :description, :string

      timestamps()
    end
  end
end
