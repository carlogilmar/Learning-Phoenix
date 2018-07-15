## Prueba de Concepto GraphQL

Agregar inserts en:

> priv/repo/seeds.exx

> mix ecto.setup

Ver playground en http://localhost:4000/graphiql

## Phoenix Contexts

- Context: encapsulate domain logic
- DDD Domain Driven Design Eric Evans 2003: software pattern

> mix phx.gen.html Identity User users name:string email:string

Context: Identity
Model: User { name, email }

The controllers call Identity for CRUD operations

>  mix phx.gen.html Identity Car cars model:string

You add more models to the same context, and then see how identity.ex is updated with the new verbs instead of have model packages

Contexts:

- Only expose methods at their outer layer
- Contexts hide internal implementations
- Use domain language when naming actions, entities and concepts


What ahppens when we need to use a Use in a different context?

- Direct Usage: import the complete context module in the context required
- Struct Conversion: Useful for read-only
- Collaborator Schema: Create an internal schema persisted in Ecto that uses a reference to the external schema

We want the context for have this in the controllers:

```
|> Marketing.visitor_for_user()
|> Marketing.subscribe_visitor_to_mail()
```

Check how to parse structs and receive structs in the functions

Recommendable:

NOT:
```
	defmodule Automax.Inpection_context do
		def get_vehicle()
		def get_vehicle_rating()
		def get_vehicle_list_price()
	end
```

DO:
```
	defmodule Automax.Inpection_context do
		def get_vehicle()
		# => %Vehicle{ rating: %Rating{}, list_price: %ListPrice{}}
	end
```

