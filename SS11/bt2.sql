use social_network_pro ;

delimiter $$
create procedure CalculatePostLikes (
in p_post_id int,
out total_likes int
)

begin
select 
count(post_id) as total_like
from likes
where post_id=p_post_id;
end $$
delimiter ;

set @like=0;
call CalculatePostLikes(101, @like);

drop procedure CalculatePostLikes;