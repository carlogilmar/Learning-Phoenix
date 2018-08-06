##### Queryable

```
iex(3)> Ecto.Queryable.to_query Recipe
#Ecto.Query<from r in Tanto.Content.Recipe>

iex(4)> %Ecto.Query{}
#Ecto.Query<from q in query>

iex(5)> %Ecto.Query{from: {"recipes", Recipe}}
#Ecto.Query<from r in Tanto.Content.Recipe>

iex(6)> Ecto.Queryable.to_query( Recipe) |> Map.from_struct
%{
  assocs: [],
  distinct: nil,
  from: {"recipes", Tanto.Content.Recipe},
  group_bys: [],
  havings: [],
  joins: [],
  limit: nil,
  lock: nil,
  offset: nil,
  order_bys: [],
  prefix: nil,
  preloads: [],
  select: nil,
  sources: nil,
  updates: [],
  wheres: []
}
```

Complex Queries using Queryable

```
iex(7)> queryable = %Ecto.Query{
...(7)> from: {"recipes", Recipe},
...(7)> limit: %Ecto.Query.QueryExpr{ expr: 2}
...(7)> }

iex(16)> queryable |> Repo.all

22:58:18.237 [debug] QUERY OK source="recipes" db=3.9ms decode=4.4ms
SELECT r0."id", r0."title", r0."body", r0."lang_code", r0."servings", r0."slug", r0."status", r0."user_id" FROM "recipes" AS r0 LIMIT 2 []
[
  %Tanto.Content.Recipe{
    __meta__: #Ecto.Schema.Metadata<:loaded, "recipes">,
    body: nil,
    id: 1,
    lang_code: nil,
    servings: nil,
    slug: nil,
    status: "Published",
    title: "Titulo Fake",
    user_id: nil
  },
  %Tanto.Content.Recipe{
    __meta__: #Ecto.Schema.Metadata<:loaded, "recipes">,
    body: nil,
    id: 2,
    lang_code: nil,
    servings: nil,
    slug: nil,
    status: "Published",
    title: "Fluffy Pancakes",
    user_id: nil
  }
]
```

Other option:

```
 from( r in Recipe, limit: 2) |> Repo.all
```

```
iex(26)> query = from r in Recipe, where: [status: "Published", title: "Titulo Fake"]
#Ecto.Query<from r in Tanto.Content.Recipe,
 where: r.status == "Published" and r.title == "Titulo Fake">
iex(27)> query |> Repo.all
```

Pipeline syntax

```
import Ecto.Query
Recipe
|> where(ingredients: "Chicken", servings: 3)
|> Repo.all
```

Get select fields of a record

```
from( r in Recipe, select: [:title, :status]) |> Repo.all
```

Get result set as map

```
iex(31)> query = from( r in Recipe, select: %{ title: r.title, status: r.status}) |> Repo.all

23:07:51.109 [debug] QUERY OK source="recipes" db=2.1ms
SELECT r0."title", r0."status" FROM "recipes" AS r0 []
[
  %{status: "Published", title: "Titulo Fake"},
  %{status: "Published", title: "Fluffy Pancakes"},
  %{status: "Published", title: "Garlic Chicken"}
]
```

Get result set as tuples

```
iex(32)> query = from( r in Recipe, select: { r.title,r.status}) |> Repo.all

23:10:13.648 [debug] QUERY OK source="recipes" db=3.9ms
SELECT r0."title", r0."status" FROM "recipes" AS r0 []
[
  {"Titulo Fake", "Published"},
  {"Fluffy Pancakes", "Published"},
  {"Garlic Chicken", "Published"}
]
```

Macro Syntax

```
Recipe
|> select([r], {r.title, r.servings})
|> Repo.all
```

Order records by column

```
iex(37)> query = from(r in Recipe, order_by: [asc: :title])
#Ecto.Query<from r in Tanto.Content.Recipe, order_by: [asc: r.title]>
iex(38)> query |> Repo.all
```

Limit the number of records

```
iex(40)> query = from( r in Recipe, limit: 2)
#Ecto.Query<from r in Tanto.Content.Recipe, limit: 2>
iex(41)> query |> Repo.all
```

Offset for paginate

```
query = from (r in Recipe, limit: 10, offset: 10)
Repo.all(query)
```

Most recent record

```
Recipe |> last |> Repo.one
```

