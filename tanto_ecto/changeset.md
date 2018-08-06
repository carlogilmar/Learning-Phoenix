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
