-- ActiveRecord の migration を使うかな
-- bundle exec rails db:migrate --trace

/*
create table if not exists books
(
    id          bigint auto_increment
    primary key,
    title       varchar(255) null,
    description varchar(255) null,
    published   date         null,
    rent        tinyint(1)   null,
    return_date date         null,
    created_at  datetime(6)  not null,
    updated_at  datetime(6)  not null
    );

create table if not exists categories
(
    id         bigint auto_increment
    primary key,
    name       varchar(255) null,
    created_at datetime(6)  not null,
    updated_at datetime(6)  not null
    );

create table if not exists books_categories
(
    id          bigint auto_increment
    primary key,
    book_id     bigint      not null,
    category_id bigint      not null,
    created_at  datetime(6) not null,
    updated_at  datetime(6) not null,
    constraint fk_rails_426cc1dbb3
    foreign key (category_id) references categories (id),
    constraint fk_rails_4b64804a3a
    foreign key (book_id) references books (id)
    );

create index index_books_categories_on_book_id
    on books_categories (book_id);

create index index_books_categories_on_category_id
    on books_categories (category_id);

create table if not exists users
(
    id           bigint auto_increment
    primary key,
    email        varchar(255) null,
    password     varchar(255) null,
    role_type    varchar(255) null,
    joining_date date         null,
    created_at   datetime(6)  not null,
    updated_at   datetime(6)  not null
    );

create table if not exists rental_histories
(
    id          bigint auto_increment
    primary key,
    start_date  date        null,
    return_date date        null,
    created_at  datetime(6) not null,
    updated_at  datetime(6) not null,
    user_id     bigint      not null,
    book_id     bigint      not null,
    constraint fk_rails_2fbc6cb169
    foreign key (book_id) references books (id),
    constraint fk_rails_3af6b01436
    foreign key (user_id) references users (id)
    );

create index index_rental_histories_on_book_id
    on rental_histories (book_id);

create index index_rental_histories_on_user_id
    on rental_histories (user_id);

create table if not exists reviews
(
    id          bigint auto_increment
    primary key,
    title       varchar(255) null,
    description varchar(255) null,
    rating      int          null,
    date        date         null,
    created_at  datetime(6)  not null,
    updated_at  datetime(6)  not null,
    user_id     bigint       not null,
    book_id     bigint       not null,
    constraint fk_rails_74a66bd6c5
    foreign key (user_id) references users (id),
    constraint fk_rails_924a0b30ca
    foreign key (book_id) references books (id)
    );

create table if not exists comments
(
    id             bigint auto_increment
    primary key,
    title          varchar(255) null,
    content        text         null,
    favorite_count int          null,
    date           date         null,
    edited         tinyint(1)   null,
    created_at     datetime(6)  not null,
    updated_at     datetime(6)  not null,
    user_id        bigint       not null,
    review_id      bigint       not null,
    constraint fk_rails_03de2dc08c
    foreign key (user_id) references users (id),
    constraint fk_rails_5350d1b47c
    foreign key (review_id) references reviews (id)
    );

create index index_comments_on_review_id
    on comments (review_id);

create index index_comments_on_user_id
    on comments (user_id);

create index index_reviews_on_book_id
    on reviews (book_id);

create index index_reviews_on_user_id
    on reviews (user_id);

*/