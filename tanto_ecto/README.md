 ### Learning Ecto

- feature/ecto Create an empty project
- feature/ecto Add dependencies for postgres and ecto
- feature/ecto Adding repository
- feature/ecto Set database credentials
- feature/ecto Add the repository process to the supervisor
- feature/ecto Add a migration for create a database
- feature/ecto Enable citext as a migration database
- feature/ecto Add a migration for create a users table
- feature/ecto Add foreign key reference user-recipe
- feature/ecto Create an Ecto Schema for represent an business Entity
- feature/ecto
- feature/ecto
- feature/ecto
- feature/ecto
- feature/ecto

### Generate a Repository

> mix ecto.gen.repo -r Tanto.Repo

Remember: add as a supervisor child in application.ex

### Ecto migrate and rollback

> mix ecto.migrate

> mix ecto.migrations

> mix ecto.rollback

> mix ecto.rollback -v 20170617092251

Undo all migrations

> mix ecto.rollback --all

Undo last `n` migrations

> mix ecto.rollback -n 3

### Postgress

> pgcli -d tanto_repo

> \q

> \d recipes

> \d schema_migrations

### DB Macros

> references(:users, on_delete: :delete_all)

> references( table_name, behaviour )

### Ecto Schemas

Macro: **use Ecto.Schema**

```
schema "table_name" do
  field :field_name, :field_type
end
```

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

