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

