with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Ada.Strings;           use Ada.Strings;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure sum_in_loop with
   SPARK_Mode => ON
is

   function Sums (A, B : Integer) return Integer with
      Depends => (Sums'Result => (A, B)),
      Pre     => (A >= 0 and then B <= Integer'Last - A),
      Post    => Sums'Result = A + B;
   function Sums (A, B : Integer) return Integer is
   begin
      return A + B;
   end Sums;

   procedure Sum_Of_Loop (Cases : in Integer; Acc : in Integer;
                        Res : out Unbounded_String) with
      Pre => (Cases >= 1 and Cases <= 50);
   procedure Sum_Of_Loop (Cases : in Integer; Acc : in Integer;
                        Res : out Unbounded_String) is
      Curr : Integer;
      New_Acc : Integer;
   begin
      Get (Curr);
      pragma Assume (Curr >= 0);
      pragma Assume (Acc <= Integer'Last - Curr);
      New_Acc := Sums (Curr, Acc);
      if Cases = 1 then
         Res := To_Unbounded_String (Integer'Image (New_Acc));
      else
         Sum_Of_Loop (Cases - 1, New_Acc, Res);
      end if;
   end Sum_Of_Loop;

   procedure Main;
   procedure Main is
      Cases : Integer;
      Acc   : Integer;
      Res   : Unbounded_String;
   begin
      Get (Cases);
      pragma Assume (Cases > 0);
      pragma Assume (Cases <= 50);
      Acc := 0;
      Sum_Of_Loop (Cases, Acc, Res);
      Trim (Res, Left);
      Put_Line (To_String (Res));
   end Main;

begin
   Main;
end sum_in_loop;

