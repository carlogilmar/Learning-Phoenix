### Generate a Repository

 mix ecto.gen.repo -r Tanto.Repo

Remember: add as a supervisor child in application.ex

### Ecto migrate and rollback

```
 mix ecto.migrate

 mix ecto.migrations

 mix ecto.rollback

 mix ecto.rollback -v 20170617092251
```

Undo all migrations

```
 mix ecto.rollback --all
```

Undo last `n` migrations

```
 mix ecto.rollback -n 3
```

### Postgress

```
 pgcli -d tanto_repo

 \q

 \d recipes

 \d schema_migrations
```

### DB Macros

```
 references(:users, on_delete: :delete_all)

 references( table_name, behaviour )
```

### Ecto Schemas

Macro: **use Ecto.Schema**

```
schema "table_name" do
  field :field_name, :field_type
end
```

