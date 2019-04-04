with Coursework; use Coursework;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
--x : Integer := 10 ;
begin

   Put_Line("Submarine is: ");
   Put_Line(sub.stat'Image);
   operationPermitted;
   submergeSub;
   Put_Line("Submarine is: ");
   Put_Line(sub.stat'Image);
   --surfaceSub;
   checkOxg;
   Put_Line("Submarine is: ");
   Put_Line(sub.stat'Image);
   Put_Line("Airlock is: ");
   Put_Line(airlocks.airlocksA(1)'Image);
   openAirlock;
   Put_Line("Airlock is: ");
   Put_Line(airlocks.airlocksA(1)'Image);
end Main;
