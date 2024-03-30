defmodule Tester.ComesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tester.Comes` context.
  """

  @doc """
  Generate a come.
  """
  def come_fixture(attrs \\ %{}) do
    {:ok, come} =
      attrs
      |> Enum.into(%{
        description: "some description",
        text: "some text"
      })
      |> Tester.Comes.create_come()

    come
  end
end
