with Ada.Text_IO; use Ada.Text_IO;      --  Put_Line
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;                --  Put
with DATA1; use DATA1;
with DATA2; use DATA2;

procedure PARENT is
   procedure CHILD is separate;
begin
   I := 1;
   J := 20;
   CHILD;
   K := J + I;
   
   Put_Line("Hello");
   Put(K, 10);                          --  10桁表示
end PARENT;

