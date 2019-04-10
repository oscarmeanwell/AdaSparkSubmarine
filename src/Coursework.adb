package body Coursework with SPARK_Mode
is
   procedure submergeSub is
   begin
      --operationPermitted;
      if(sub.air(1) = Closed and then sub.air(2) = Closed and then sub.oxn = Present and then sub.reac = Normal) then
         sub.stat := Submerged;
         sub.dive.currentDepth := 10;
      end if;
   end submergeSub;


   procedure openAirlock is
      --If one of the airlocks is open, dont open the next
   begin
      if(sub.air(1) = Closed and then sub.air(2) = Closed) then
         sub.air(1) := Open;
      end if;
   end openAirlock;

   procedure surfaceSub is
      --Surface the submarine
   begin
      if(sub.stat = Submerged and then sub.air(1) = Closed and then sub.air(2) = Closed) then
         sub.stat := Surfaced;
         sub.dive.currentDepth := 0;
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
      if(sub.stat = Submerged and then sub.oxn = Present and then sub.air(1) = Closed
         and then sub.air(2) = Closed and then sub.dive.currentDepth < sub.dive.safeDiveDepth) then

         sub.dive.isDiving := True;

         sub.dive.currentDepth := sub.dive.currentDepth + 100;
         --Is this how to do this?
      end if;
   end diveSub;

   procedure closeAirlock is
   begin
      if(sub.air(1) = Open) then
         sub.air(1) := Closed;
      end if;
   end closeAirlock;

end Coursework;
