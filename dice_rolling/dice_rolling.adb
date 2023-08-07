with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Ada.Strings;           use Ada.Strings;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure rolling with
   SPARK_Mode => ON
is

   function Floating (R : Float) return Integer with
      Pre     => (R > -1.0 and then R < 10.0),
      Post    => Floating'Result = Integer (Float'Floor (R * 6.0 + 1.0));
   function Floating (R : Float) return Integer is
   begin
      return Integer (Float'Floor (R * 6.0 + 1.0));
   end Floating;

   procedure Dice_Rolling (Cases : in Integer;
                        Res : in out Unbounded_String) with
      Pre => (Cases >= 1 and Cases <= 50)
               and then Length (Res) < Integer'Last - 30 * Cases;
   procedure Dice_Rolling (Cases : in Integer;
                        Res : in out Unbounded_String) is
      Curr : Float;
      Acc  : Integer;
   begin
      Get (Curr);
      pragma Assume (Curr > -1.0);
      pragma Assume (Curr < 10.0);
      Acc := Floating (Curr);
      if Cases = 1 then
         Res := Res & To_Unbounded_String (Integer'Image (Acc));
         pragma Assert (Length (Res) < Integer'Last - 30 * (Cases - 1));
      else
         Res := Res & To_Unbounded_String (Integer'Image (Acc));
         pragma Assert (Length (Res) < Integer'Last - 30 * (Cases - 1));
         Dice_Rolling (Cases - 1, Res);
      end if;
   end Dice_Rolling;

   procedure Main;
   procedure Main is
      Cases : Integer;
      Res   : Unbounded_String := To_Unbounded_String ("");
   begin
      Get (Cases);
      pragma Assume (Cases > 0);
      pragma Assume (Cases <= 50);
      Dice_Rolling (Cases, Res);
      Trim (Res, Left);
      Put_Line (To_String (Res));
   end Main;

begin
   Main;
end rolling;
