create sequence perawatan_sq
  minvalue 1
  maxvalue 999999999
  start with 1
  increment by 1
  cache 20;

create or replace trigger perawatan_trig
before insert on perawatan
for each row
declare
  new_id varchar(4);
  cur_id number;
begin
  if inserting and :new.id_perawatan is null then
    cur_id := perawatan_sq.nextval;
    if cur_id < 10 then
      select concat('T00', cur_id) into new_id from dual;
    else
      if cur_id < 100 then
        select concat('T0', cur_id) into new_id from dual;
      else
        select concat('D', cur_id) into new_id from dual;
      end if;
    end if;
  :new.id_perawatan := new_id;
  end if;
end;