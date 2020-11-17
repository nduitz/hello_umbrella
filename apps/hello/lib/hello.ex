defmodule Hello do
  @moduledoc """
  Hello keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  require Identification

  def hello do
    queried = query_foo() |> Hello.Repo.one!()

    baz = queried.other_field
    IO.inspect(baz)

    with(
      true <- is_nil(queried.foo.bar),
      update_arguments = %{
        foo: queried.foo
      }
    ) do
      IO.inspect(update_arguments)
      IO.inspect(queried)
      %{foo: %{other_id: _other_id} = foo} = queried
      Identification.from(foo, Other)
    end
  end

  defp query_foo() do
    import Ecto.Query

    from(f in Foo)
    |> select([f], %{
      foo: f
      # other: :other_field
    })
  end
end
