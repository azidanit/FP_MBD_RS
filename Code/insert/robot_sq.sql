create sequence robot_sq
   minvalue 1
  maxvalue 999999999
  start with 1
  increment by 1
  cache 20;

create or replace trigger robot_sq_trig 
before insert on robot 
for each row 
declare 
  new_id varchar(5); 
  cur_id number; 
begin 
  if inserting and :new.id_robot is null then 
    cur_id := robot_sq.nextval; 
    if cur_id < 10 then 
      select concat('R000', cur_id) into new_id from dual; 
    else 
      if cur_id < 100 then 
        select concat('R00', cur_id) into new_id from dual; 
      else 
        if cur_id < 1000 then 
          select concat('R0', cur_id) into new_id from dual; 
        else 
          select concat('R', cur_id) into new_id from dual; 
        end if; 
      end if; 
    end if; 
  :new.id_robot := new_id; 
  end if; 
end;


