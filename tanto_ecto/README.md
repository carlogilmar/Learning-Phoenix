 ### Learning Ecto

- feature/ecto Create an empty project
- feature/ecto Add dependencies for postgres and ecto
- feature/ecto Adding repository
- feature/ecto Set database credentials
- feature/ecto Add the repository process to the supervisor
- feature/ecto Add a migration for create a database
- feature/ecto Enable citext as a migration database
- feature/ecto
- feature/ecto
- feature/ecto
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
