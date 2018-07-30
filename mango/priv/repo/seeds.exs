alias Mango.Repo
alias Mango.Catalog.Product
Repo.insert %Product{name: "Tomato", price: 50, is_seasonal: false, category: "vegetables"}
Repo.insert %Product{name: "Apple", price: 100, is_seasonal: true, category: "fruits"}
