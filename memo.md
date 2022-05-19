- setup 

```shell
$ rbenv local 3.1.2

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

- relation の確認

```sql
USE INFORMATION_SCHEMA;
SELECT TABLE_NAME,
       COLUMN_NAME,
       CONSTRAINT_NAME,
       REFERENCED_TABLE_NAME,
       REFERENCED_COLUMN_NAME
FROM KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = "table_schema"
-- WHERE TABLE_SCHEMA = "library_development"
  AND TABLE_NAME = "table_name"
--   AND TABLE_NAME = "books_categories"
  AND REFERENCED_COLUMN_NAME IS NOT NULL;
```
