defmodule Tester.TasksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tester.Tasks` context.
  """

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        description: "some description",
        text: "some text"
      })
      |> Tester.Tasks.create_task()

    task
  end
end
