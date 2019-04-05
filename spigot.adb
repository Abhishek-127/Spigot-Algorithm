with ada.Text_IO; use Ada.Text_IO;
with ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Calendar; use Ada.Calendar;

procedure spigot is

    procedure get_filename(filename: in out string) is
    i : integer;
    begin
        put_line("Enter a filename: ");
        get_line(filename, i);
    end get_filename;

    filename : string(1..100);
    i, j, k, q, x : integer := 0;
    len, nines, predigit : integer := 0;
    N : constant integer := 1000;
    a : array (1..3334) of integer;
begin
    put_line("Hello");
    get_filename(filename);
    put_line(filename);
    len := (10 * N/3) + 1;

    a := (1..3334 => 2);
    for i in reverse 10..1 loop
        put(i);
    end loop;

    for j in 1..N loop
        q := 0;
        for i in reverse 1..len loop
            x := 10 * a(i) + q * i;
            a(i) := x mod (2 * i - 1);
            q := x / (2 * i - 1);
        end loop;
        a(1) := q mod 10;
        q := q/10;
        if(q = 9) then
            nines := nines + 1;
        elsif(q = 10) then
            put(predigit+1);
            for k in 0..nines-1 loop
                put(0);
            end loop;

            predigit := 0;
            nines := 0;
        else
            put(predigit);
            predigit := q;
            if(nines /= 0) then
                for k in 0..nines-1 loop
                    put(9);
                end loop;
                nines := 0;
            end if;
        end if;
    end loop;
    put(predigit);
end spigot;