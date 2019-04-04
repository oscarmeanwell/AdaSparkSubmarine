package body Coursework with SPARK_Mode
is
   procedure submergeSub is
   begin
      if(airlocks.allowed = True and then sub.oxn = Present) then
         sub.stat := Submerged;
      end if;
   end submergeSub;


   procedure operationPermitted is
   begin
         airlocks.allowed := True;
   end operationPermitted;


   procedure openAirlock is
      --If one of the airlocks is open, dont open the next
   begin
      if(airlocks.airlocksA(1) = Closed and then airlocks.airlocksA(2) = Closed) then
         airlocks.airlocksA(1) := Open;
      end if;
   end openAirlock;

   procedure surfaceSub is
   begin
      sub.stat := Surfaced;
   end surfaceSub;

end Coursework;
