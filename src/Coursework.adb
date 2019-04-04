package body Coursework with SPARK_Mode
is
   procedure submergeSub is
   begin
      if(airlocks.allowed = True and then sub.oxn = Present) then
         sub.stat := Submerged;
      end if;
   end submergeSub;


   procedure operationPermitted is
      --Are both airlocks shut?
   begin
      if(airlocks.airlocksA(1) = Closed and then airlocks.airlocksA(2) = Closed) then
         airlocks.allowed := True;
      end if;
   end operationPermitted;


   procedure openAirlock is
      --If one of the airlocks is open, dont open the next
   begin
      if(airlocks.airlocksA(1) = Closed and then airlocks.airlocksA(2) = Closed) then
         airlocks.airlocksA(1) := Open;
      end if;
   end openAirlock;

   procedure surfaceSub is
      --Surface the submarine
   begin
      if(sub.stat = Submerged) then
         sub.stat := Surfaced;
      end if;
   end surfaceSub;

   procedure checkOxg is
   begin
      --Check the oxegen Levels
      --sub.oxn := Low;
      if(sub.oxn = Low and then sub.stat = Submerged and then airlocks.allowed = True) then
          surfaceSub;
      end if;
   end checkOxg;

   procedure checkReactor is
      --Check the reactor
   begin
      if(sub.reac = Overheated and then sub.stat = Submerged and then airlocks.allowed = True) then
         surfaceSub;
      end if;
   end checkReactor;

   procedure diveSub is
      --Dive the sub
   begin
      if(sub.stat = Submerged and then sub.oxn = Present and then airlocks.allowed = True) then
         sub.dive := True;
         --Is this how to do this?
      end if;
   end diveSub;

end Coursework;
