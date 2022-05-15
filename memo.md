- setup 

```shell
$ rbenv local 3.1.1

$ ruby --version

$ rails new library --api

$ cd library
```

- migrate

```shell
$ bundle exec rails db:migrate --trace

$ bundle exec rails db:seed --trace

$ bundle exec rails c
irb(main):001:0> User.all
```
