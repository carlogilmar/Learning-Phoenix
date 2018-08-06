#### Changesets

Internally...

```
%Recipe{title: "My recipe"} |> Repo.insert

=

Ecto.Changeset.change(%Recipe{title: "My recipe"}) |> Repo.insert
```

Changeset as validator using with repo

```
%Recipe{} |> Recipe.changeset( %{} ) |> Repo.insert
```

```
defmodule Tanto.Content.Recipe do

  use Ecto.Schema
  import Ecto.Changeset
  alias Tanto.Content.Recipe

  schema "recipes" do
    ...
  end

  def changeset(%Recipe{} = recipe, attrs) do
    recipe
      |> cast( attrs, [:title])
      |> validate_required([:title])
  end

end
```

### Validations

Exclude values

```
  validate_exclusion(:title, ~w(title fake_title))
```

Inclusive values

```
iex(3)> %Recipe{} |> Recipe.changeset(%{title: "hola"})
#Ecto.Changeset<
  action: nil,
  changes: %{title: "hola"},
  errors: [title: {"is invalid", [validation: :inclusion]}],
  data: #Tanto.Content.Recipe<>,
  valid?: false
>
```

## This isn't the same

```
%Recipe{} |> Recipe.changeset(%{title: "hola"})
```

```
%Recipe{title: "hola"} |> Recipe.changeset(%{})
```

Validate a number

```
 |> validate_number([:servings])
```
