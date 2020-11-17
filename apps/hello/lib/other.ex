defmodule Other do
  use Ecto.Schema
  def identified_module, do: __MODULE__.Identified

  defmodule Identified do
    defstruct [:id, {__MODULE__, true}]
  end

  schema "foo" do
    field(:bar, :string)
    field(:baz, :string)
  end
end
