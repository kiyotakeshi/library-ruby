# library_ruby

## run locally

- start database 

```shell
$ docker compose -f docker/docker-compose.yaml up -d

$ docker compose -f docker/docker-compose.yaml ps
```

- apply migration and seed data

```shell
$ bundle exec rails db:migrate --trace

$ bundle exec rails db:seed --trace
```

- run

```shell
$ bundle exec rails s
```

---
## run test

```shell
$ make all
```

---
## tear down

```shell
$ docker compose -f docker/docker-compose.yaml down
```
