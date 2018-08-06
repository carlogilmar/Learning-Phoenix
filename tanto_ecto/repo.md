### Repo

#### Insert

```
%Recipe{title: "Chicken Broccoli Salad"}
|> Repo.insert
```

Inspect meta

```
 iex(x)> %Recipe{} |> Map.get(:__meta__) |> Map.from_struct
  %{context: nil, source: {nil, "recipes"}, state: :built}
```

Find All

```
Recipe |> Repo.all
```

Find by id

```
Recipe |> Repo.get(1)
```

Find by value

```
Recipe |> Repo.get_by(title: "Titulo Fake")
```

Multiple inserts

```
recipe_data = [
                %{title: "Fluffy Pancakes"},
                %{title: "Garlic Chicken"}
              ]
Recipe
|> Repo.insert_all(recipe_data)
```

Update

```
Recipe |> Repo.update_all(set: [status: "Published"])
```

Delete a record

```
recipe = Repo.get!(Recipe, 2)

recipe |> Repo.delete
```

