defmodule Innovities.ContentTest do
  use Innovities.DataCase

  alias Innovities.Content

  describe "ideas" do
    alias Innovities.Content.Idea

    @valid_attrs %{long_description: "some long_description", short_description: "some short_description"}
    @update_attrs %{long_description: "some updated long_description", short_description: "some updated short_description"}
    @invalid_attrs %{long_description: nil, short_description: nil}

    def idea_fixture(attrs \\ %{}) do
      {:ok, idea} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Content.create_idea()

      idea
    end

    test "list_ideas/0 returns all ideas" do
      idea = idea_fixture()
      assert Content.list_ideas() == [idea]
    end

    test "get_idea!/1 returns the idea with given id" do
      idea = idea_fixture()
      assert Content.get_idea!(idea.id) == idea
    end

    test "create_idea/1 with valid data creates a idea" do
      assert {:ok, %Idea{} = idea} = Content.create_idea(@valid_attrs)
      assert idea.long_description == "some long_description"
      assert idea.short_description == "some short_description"
    end

    test "create_idea/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_idea(@invalid_attrs)
    end

    test "update_idea/2 with valid data updates the idea" do
      idea = idea_fixture()
      assert {:ok, idea} = Content.update_idea(idea, @update_attrs)
      assert %Idea{} = idea
      assert idea.long_description == "some updated long_description"
      assert idea.short_description == "some updated short_description"
    end

    test "update_idea/2 with invalid data returns error changeset" do
      idea = idea_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_idea(idea, @invalid_attrs)
      assert idea == Content.get_idea!(idea.id)
    end

    test "delete_idea/1 deletes the idea" do
      idea = idea_fixture()
      assert {:ok, %Idea{}} = Content.delete_idea(idea)
      assert_raise Ecto.NoResultsError, fn -> Content.get_idea!(idea.id) end
    end

    test "change_idea/1 returns a idea changeset" do
      idea = idea_fixture()
      assert %Ecto.Changeset{} = Content.change_idea(idea)
    end
  end
end
