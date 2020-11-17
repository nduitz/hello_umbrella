defmodule Identification do
  defmacro from(map, schema) do
    schema = Macro.expand(schema, __CALLER__)
    resource_name = schema |> Module.split() |> List.last() |> Macro.underscore()
    field_name = resource_name <> "_id"
    field = String.to_existing_atom(field_name)
    identified_module = schema.identified_module

    quote do
      %{unquote(field) => id} = unquote(map)
      %unquote(identified_module){id: id}
    end
  end
end
