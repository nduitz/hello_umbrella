defmodule Hello.Repo.Migrations.CreateFoo do
  use Ecto.Migration

  def change do
    create table(:foo) do
      add :bar, :string
      add :baz, :string
    end
  end
end
