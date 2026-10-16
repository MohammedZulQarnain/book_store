# Book Store (API)

A simple Rails 6.1 API-only backend for a bookstore service (Ruby 2.7.2, PostgreSQL).

Quickstart (development)

Prerequisites: Ruby 2.7.2, Bundler, PostgreSQL.

1. Install gems

```bash
bundle install
```

2. Configure the database

Edit `config/database.yml` or set `DATABASE_URL`. For production the app reads `BOOK_STORE_DATABASE_PASSWORD`.

3. Create and migrate the database

```bash
bin/rails db:create db:migrate db:seed
```

4. Run the server

```bash
bin/rails server
```

Run tests

```bash
bin/rails test
```

Example curl (after adding routes/controllers)

```bash
curl -X GET http://localhost:3000/books
```


