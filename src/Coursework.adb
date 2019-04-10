package body Coursework with SPARK_Mode
is
   procedure submergeSub is
   begin
      --operationPermitted;
      if(airlocks.airlocksA(1) = Closed and then airlocks.airlocksA(2) = Closed and then sub.oxn = Present and then sub.reac = Normal) then
         sub.stat := Submerged;
      end if;
   end submergeSub;


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
      if(sub.stat = Submerged and then airlocks.airlocksA(1) = Closed and then airlocks.airlocksA(2) = Closed) then
         sub.stat := Surfaced;
      end if;
   end surfaceSub;

   procedure checkOxg is
   begin
      --Check the oxegen Levels
      --sub.oxn := Low;
      if(sub.oxn = Low and then sub.stat = Submerged) then
         surfaceSub;
      end if;
   end checkOxg;

   procedure checkReactor is
      --Check the reactor
   begin
      if(sub.reac = Overheated and then sub.stat = Submerged) then
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

   procedure closeAirlock is
   begin
      if(airlocks.airlocksA(1) = Open) then
         airlocks.airlocksA(1) := Closed;
      end if;
   end closeAirlock;

end Coursework;
