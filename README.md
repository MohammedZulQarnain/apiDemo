# apiDemo

A small Rails API that provides a simple Products resource (list, show, create). Intended as a minimal example or starter API for learning and demos.

## Stack
- Language: Ruby (project uses Ruby 2.7.x)
- Framework: Ruby on Rails (API-style app)
- Server: Puma
- Notable libraries: Rails, Puma, ActiveRecord (DB adapter configured in config/database.yml)

## What it does
Exposes a JSON API under /api/v1 for a Product model with the attributes:
- name (string)
- brand (string)
- price (numeric)
- description (text)

Routes:
- GET  /api/v1/products        — list products (ordered by name asc)
- GET  /api/v1/products/:id    — show one product
- POST /api/v1/products        — create a product (accepts product JSON)

See config/routes.rb and app/controllers/api/v1/products_controller.rb for implementation details.

## Quick start (development)

Prerequisites
- Ruby 2.7.x (see .ruby-version / Gemfile)
- Bundler
- A database (check config/database.yml — the project can be configured for SQLite or PostgreSQL)

Commands
```bash
git clone https://github.com/MohammedZulQarnain/apiDemo.git
cd apiDemo

# install gems
bundle install

# create and migrate the database (adjust env/database adapter if needed)
bin/rails db:create db:migrate

# (optional) seed the database if seeds.rb exists
bin/rails db:seed

# start the server (default 3000)
bin/rails server
# or
bin/rails s -p 3000
```

The API will be available at http://localhost:3000.

## Example requests

List products:
```bash
curl -s http://localhost:3000/api/v1/products | jq .
```

Show product (id = 1):
```bash
curl -s http://localhost:3000/api/v1/products/1 | jq .
```

Create product:
```bash
curl -X POST http://localhost:3000/api/v1/products \
  -H "Content-Type: application/json" \
  -d '{"product": {"name":"Example","brand":"Acme","price":12.99,"description":"Sample product"}}'
```

Successful creation returns the created product JSON; error responses return an error object.

## Tests
Run the test suite (minitest / Rails default tests):
```bash
bin/rails test
# or
rake test
```

## Configuration & notes
- Check config/database.yml to select/configure your DB adapter (SQLite/Postgres).
- Puma configuration is in config/puma.rb.
- Credentials and other secrets are stored with Rails encrypted credentials (config/credentials.yml.enc) — use bin/rails credentials:edit to modify with the correct master key.
- The controller uses strong parameters (see prod_params in app/controllers/api/v1/products_controller.rb) — POST payload must nest product attributes under the `product` key.

## Contributing
- Fork, create a branch for your feature/fix, open a pull request.
- Keep changes focused and include tests when appropriate.

## License
No license specified. Add a LICENSE file if you intend to open-source this project.
