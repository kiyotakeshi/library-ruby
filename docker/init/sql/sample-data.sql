-- ActiveRecord の seed を使う
-- @see db/seeds.rb
-- $ bundle exec rails db:seed --trace

-- SET NAMES utf8mb4;

/*
USE library_development;

-- user
INSERT INTO users (email, name, password, role_type, joining_date, created_at, updated_at) VALUES
('mike@example.com', 'mike', '1qazxsw2', 'admin', '2022-05-16', '2022-05-16 09:32:28.000000','2022-05-16 09:32:30.000000'),
('popcorn@example.com', 'popcorn', '2wsxzaq1', 'user', '2022-05-20', '2022-05-16 09:32:28.000000','2022-05-16 09:32:30.000000');

select u.id, u.email
from users u;

-- book
INSERT INTO books
(title, description, published, rent, return_date, created_at, updated_at) VALUES
('java beginner', 'for java beginner', '2022-05-16', 0, null, '2022-05-16 09:30:11.000000', '2022-05-16 09:30:14.000000'),
('ruby beginner', 'for ruby beginner', '2022-05-20', 0, null, '2022-05-16 09:30:11.000000', '2022-05-16 09:30:14.000000');

select b.id, b.title
from books b;

-- review
INSERT INTO reviews (title, content, rating, date, created_at, updated_at, user_id, book_id) VALUES
('good', 'good for me', 4, '2022-05-16', '2022-05-16 09:31:44.000000', '2022-05-16 09:31:51.000000', 1, 1),
('excellent', 'excellent for me', 5, '2022-05-20', '2022-05-16 09:31:44.000000', '2022-05-16 09:31:51.000000', 1, 2),
('so so', 'so so for me', 2, '2022-05-20', '2022-05-16 09:31:44.000000', '2022-05-16 09:31:51.000000', 2, 1);

select r.id, r.title from reviews r;

select *
from books b
         join reviews r on b.id = r.book_id
         join users u on r.user_id = u.id
where b.id = 1;

select r.id, r.title, u.name as user_name from reviews r
join users u on r.user_id = u.id
where u.id = 1
order by r.id;

-- category
INSERT INTO categories (name, created_at, updated_at) VALUES
('java', '2022-05-20 07:58:12.000000', '2022-05-20 07:58:13.000000'),
('kotlin', '2022-05-20 07:59:48.000000', '2022-05-20 07:59:50.000000'),
('jvm', '2022-05-20 07:59:48.000000', '2022-05-20 07:59:50.000000'),
('server-side', '2022-05-20 07:59:48.000000', '2022-05-20 07:59:50.000000');

select c.name from categories c;

--- books_categories
INSERT INTO books_categories (book_id, category_id, created_at, updated_at) VALUES
(1, 1, '2022-05-20 23:08:01.000000', '2022-05-20 23:08:02.000000'),
(1, 3, '2022-05-20 23:08:01.000000', '2022-05-20 23:08:02.000000'),
(1, 4, '2022-05-20 23:08:01.000000', '2022-05-20 23:08:02.000000');

select b.title, c.id, c.name from books b
join books_categories bc on b.id = bc.book_id
join categories c on bc.category_id = c.id
order by c.id;

select bc.book_id, c.id, c.name
from categories c
         inner join books_categories bc on c.id = bc.category_id
where bc.book_id = 1
order by c.id;

--- rental history
INSERT INTO rental_histories (start_date, return_date, created_at, updated_at, user_id, book_id) VALUES
('2022-05-20', '2022-05-27', '2022-05-20 23:48:31.000000', '2022-05-20 23:48:32.000000', 1, 1),
('2022-05-29', '2022-05-31', '2022-05-20 23:48:31.000000', '2022-05-20 23:48:32.000000', 1, 2);

select u.name, u.email, rh.start_date, rh.return_date from users u
join rental_histories rh on u.id = rh.user_id
where u.id = 1;

--- comment
INSERT INTO comments (content, favorite_count, date, edited, created_at, updated_at, user_id, review_id) VALUES
('I''m just looking for java beginner book', 0, '2022-05-21', 0, '2022-05-21 00:36:50.000000', '2022-05-21 00:36:52.000000', 2, 1),
('this book has good reputation', 0, '2022-05-22', 0, '2022-05-21 00:38:43.000000', '2022-05-21 00:38:45.000000', 2, 2),
('I''ve read same book. But your insights gives me new inspiration', 0, '2022-05-21', 0, '2022-05-21 00:42:32.000000', '2022-05-21 00:42:35.000000', 1, 3);

select * from comments c
join reviews r on c.review_id = r.id
where r.id = 1;
-- */
