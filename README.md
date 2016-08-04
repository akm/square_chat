# square chat

## Setup

### Development

```bash
$ bin/setup
$ bin/rails spec
$ bin/rails s
```

open http://localhost:3000

### Production

```bash
$ export RAILS_ENV=production
$ export RAILS_SERVE_STATIC_FILES=true
$ export SECRET_KEY_BASE=$(bin/rails secret)
$ bin/rails db:create
$ bin/rails s
```

open http://localhost:3000 or http://host_or_IP:3000
