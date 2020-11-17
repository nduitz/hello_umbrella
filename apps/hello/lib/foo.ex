defmodule Foo do
  use Ecto.Schema

  schema "foo" do
    field(:bar, :string)
    field(:baz, :string)
    belongs_to :other, Other
  end
end
