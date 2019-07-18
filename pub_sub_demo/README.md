# PubSubDemo

## Using two nodes

```elixir
$ iex --sname node1@localhost -S mix
iex(node1@localhost)1> PubSubDemo.ShoppingList.start_link()
iex(node1@localhost)2> PubSubDemo.ShoppingList.get()
%{}
```

```elixir
# Terminal 2

$ iex --sname node2@localhost -S mix
iex(node2@locahost)1> Node.connect(:node1@localhost)
iex(node2@locahost)2> PubSubDemo.Fridge.take("eggplant", 1)
```

```elixir
# Terminal 1

Adding eggplant (1) to shopping list
iex(node1@localhost)3> PubSubDemo.ShoppingList.get()
%{"eggplant" => 1}
```
