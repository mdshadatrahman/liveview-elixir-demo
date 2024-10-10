defmodule LiveviewDemo.LinksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LiveviewDemo.Links` context.
  """

  @doc """
  Generate a link.
  """
  def link_fixture(attrs \\ %{}) do
    {:ok, link} =
      attrs
      |> Enum.into(%{
        body: "some body",
        url: "some url"
      })
      |> LiveviewDemo.Links.create_link()

    link
  end
end
