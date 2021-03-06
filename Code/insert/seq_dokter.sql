create sequence dokter_sq
   minvalue 1
  maxvalue 999999999
  start with 1
  increment by 1
  cache 20;

create or replace trigger dokter_sq_trigger
before insert on dokter
for each row
declare
  new_id varchar(5);
  cur_id number;
begin
  if inserting and :new.id_dokter is null then
    cur_id := dokter_sq.nextval;
    if cur_id < 10 then
      select concat('D000', cur_id) into new_id from dual;
    else
      if cur_id < 100 then
        select concat('D00', cur_id) into new_id from dual;
      else
        if cur_id < 1000 then
            select concat('D0', cur_id) into new_id from dual;
        else
         select concat('D', cur_id) into new_id from dual;
        end if;
      end if;
    end if;
  :new.id_dokter := new_id;
  end if;
end;