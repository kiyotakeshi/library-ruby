
- setup 

```shell
$ rbenv local 3.1.1
$ ruby --version
$ rails new library --api
$ cd library
```

- model, controller

```shell
$ bundle exec rails g model User name:string age:integer hobby:string
$ bundle exec rails db:migrate --trace
$ bundle exec rails db:seed --trace

$ bundle exec rails c
irb(main):001:0> User.all

$ bundle exec rails g controller Users
```

- setup robocup

- setup model
