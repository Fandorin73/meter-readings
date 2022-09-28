CREATE SCHEMA IF NOT EXISTS  "registration_users";

create table if not exists users(
                                                       id bigserial primary key,
                                                       username varchar(30) not null,
                                                       password varchar(80) not null,
                                                       email varchar(50) not null,

                                                       unique(email)
);
create table if not exists roles(
                                                 id serial primary key,
                                                 name varchar(50) not null
);
create table if not exists users_roles(
                                    user_id bigint not null,
                                    role_id int not null,
                                    primary key (user_id,role_id),
                                    foreign key (user_id) references users(id),
                                    foreign key (role_id) references roles(id)
);

insert into roles(name)
values
('ROLE_USER'),('ROLE_ADMIN');

insert into users(username,password,email)
values
    ('user','$2y$10$5M8pUcdubikOQu0yvotjAeuBjJW6BVUkisktsRySRYL5B/IzRw47.','user@gmail.com');

insert into users_roles (user_id, role_id) values (1,2);