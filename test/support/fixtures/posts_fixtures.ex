defmodule Tester.PostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tester.Posts` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> Tester.Posts.create_post()

    post
  end
end
