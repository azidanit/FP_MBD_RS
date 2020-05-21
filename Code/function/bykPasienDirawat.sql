create or replace FUNCTION countPasienRawat(tanggal Date)
return number
as 
    cursor cur_data IS
    SELECT check_out, check_in
    FROM perawatan;
    jumlah number;
    Begin
        jumlah := 0;
        for idx in cur_data
        loop
            if tanggal >= idx.check_in
                then
                if idx.check_out IS NULL or idx.check_out > tanggal
                    Then
                        jumlah := jumlah + 1;
                end if;
            end if;
        end loop;
        return jumlah;
    End;
