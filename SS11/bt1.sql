use social_network_pro;

delimiter $$
create procedure danhsach(
in p_user_id int 
)
begin 
select 
post_id as post,
content as conteenn,
created_at as lac
from posts
where user_id =p_user_id;
end $$

delimiter ;

call danhsach(4);

drop procedure danhsach;

