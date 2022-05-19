-- ActiveRecord の seed を使うかな
-- $ bundle exec rails db:seed --trace

-- SET NAMES utf8mb4;
--
-- USE library_development;

/*
-- user
INSERT INTO library_development.users (email, password, role_type, joining_date, created_at, updated_at)
VALUES ('test@example.com', '1qazxsw2', 'admin', '2022-05-16', '2022-05-16 09:32:28.000000',
        '2022-05-16 09:32:30.000000');

select u.id, u.email
from users u;

-- book
INSERT INTO library_development.books
(title, description, published, rent, return_date, created_at, updated_at)
VALUES ('test', 'test', '2022-05-16', 1, null, '2022-05-16 09:30:11.000000', '2022-05-16 09:30:14.000000');

select b.id, b.title
from books b;

-- review
INSERT INTO library_development.reviews (title, description, rating, date, created_at, updated_at, user_id, book_id)
VALUES ('test', 'test', 2, '2022-05-16', '2022-05-16 09:31:44.000000', '2022-05-16 09:31:51.000000', 1, 1);

select r.id, r.title from reviews r;

select *
from books b
         join reviews r on b.id = r.book_id
         join users u on r.user_id = u.id
where b.id = 1;
*/
