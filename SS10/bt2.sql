USE social_network_pro;
EXPLAIN ANALYZE
SELECT *
FROM users
WHERE hometown = 'Hà Nội';

create index idx_hometown
on users(hometown);

show index from users;

drop index idx_hometown on users;