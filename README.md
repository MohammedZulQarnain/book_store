# Book Store (API)

A simple Rails 6.1 API-only backend for a bookstore service (Ruby 2.7.2, PostgreSQL).

Status: Backend scaffold — models/jobs/mailers are present but no resource routes/controllers are implemented yet. Ready for endpoint development.

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

What I added

- Quickstart steps and status
- CI workflow and OpenAPI + curl examples in the repo

Next suggested steps before a client demo

- Add a short API surface (e.g. Books CRUD controller + routes)
- Provide a Postman collection or OpenAPI-driven mock server
- Add a LICENSE and CI (tests/lint) — already added in this commit

