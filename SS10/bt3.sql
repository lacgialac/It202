USE social_network_pro;


EXPLAIN ANALYZE
SELECT post_id, content, created_at
FROM posts
WHERE user_id = 1
  AND created_at >= '2026-01-01'
  AND created_at <  '2027-01-01';


create index  idx_created_at_user_id 
on posts(created_at, user_id);

drop index  idx_created_at_user_id on posts;

SHOW INDEX FROM posts;


explain analyze 
select user_id, username,email
from users
where email="an@gmail.com";

create unique index  idx_email
on users(email);

-- hmm cos index nhanh hon gap 2 lan a qua dinh cai 800 cai 400 au de

drop index  idx_email on users;


 