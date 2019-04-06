with ada.Text_IO; use Ada.Text_IO;
with ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Calendar; use Ada.Calendar;
with ada.strings.unbounded; use ada.strings.unbounded;
with ada.strings.unbounded.Text_IO; use ada.strings.unbounded.Text_IO;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings; use Ada.Strings;
with Ada.Characters.Handling;  use Ada.Characters.Handling;
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
    New_File : File_Type;
    pi : unbounded_string;
    startTime, endTime : Time;
    milliS : Duration;
begin
    put_line("Hello");
    get_filename(filename);
    put_line(filename);
    len := (10 * N/3) + 1;
    
    a := (1..3334 => 2);
    startTime := Clock;

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
            pi := pi & Trim(Integer'Image(predigit + 1), Both);
            for k in 0..nines-1 loop
                pi := pi & '0';
            end loop;

            predigit := 0;
            nines := 0;
        else
            pi := pi & Trim(Integer'Image(predigit), Both);
            predigit := q;
            if(nines /= 0) then
                for k in 0..nines-1 loop
                    pi := pi &'9';
                end loop;
                nines := 0;
            end if;
        end if;
    end loop;

    endTime := Clock;
    milliS := (endTime - startTime) * 1000;

    pi := pi & Trim(Integer'Image(predigit), Both);
    new_line;
    put_line("Runtime = " & Duration'Image(milliS) & " milliseconds.");

    Create(New_File, Out_File, filename);
    Put_Line(New_file, pi);
    Close(New_File);
end spigot;