defmodule LiveviewDemo.Repo.Migrations.MakeBodyNotRequired do
  use Ecto.Migration

  def change do
    alter table(:links) do
      modify :body, :string, null: true
    end
  end
end
