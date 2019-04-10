package body Coursework with SPARK_Mode
is

   procedure submergeSub is
   begin
      if(sub.air(1) = Locked and then sub.air(2) = Locked and then sub.oxn = Present and then sub.reac = Normal) then
         sub.stat := Submerged;
         sub.dive.currentDepth := 10;
      end if;
   end submergeSub;


   procedure openAirlock(n : Integer) is
      --If one of the airlocks is open, dont open the next
   begin
      if((n = 1 or n = 2) and then (sub.air(1) = Closed or sub.air(1) = Locked)
         and then (sub.air(2) = Closed or sub.air(2) = Locked)) then
         sub.air(n) := Open;
      end if;
   end openAirlock;

   procedure surfaceSub is
      --Surface the submarine
   begin
      if(sub.stat = Submerged and then sub.air(1) = Locked and then sub.air(2) = Locked) then
         sub.stat := Surfaced;
         sub.dive.currentDepth := 0;
      end if;
   end surfaceSub;

   procedure checkOxg(d : String) is
   begin
      --Check the oxegen Levels
      if(sub.stat = Submerged and then sub.air(1) = Locked and then sub.air(2) = Locked) then
         if(d = "Low") then
            sub.oxn := Low;
         end if;
         if(d = "Present") then
            sub.oxn := Present;
         end if;
         if(d = "Absent") then
            surfaceSub;
            sub.oxn := Absent;
         end if;
      end if;

   end checkOxg;

   procedure checkReactor is
      --Check the reactor
   begin
      if(sub.reac = Overheated and then sub.stat = Submerged and then
             sub.air(1) = Locked and then sub.air(2) = Locked) then
         surfaceSub;
      end if;
   end checkReactor;


   procedure diveSub is
   begin
      if(sub.stat = Submerged and then sub.oxn = Present and then sub.air(1) = Locked
         and then sub.air(2) = Locked and then sub.dive.currentDepth < sub.dive.safeDiveDepth) then
         sub.dive.currentDepth := sub.dive.currentDepth + 100;
      end if;
   end diveSub;

   procedure closeAirlock(n : Integer) is
   begin
      if((n = 1 or n = 2) and then sub.air(n) = Open) then
         sub.air(n) := Closed;
      end if;
   end closeAirlock;

   procedure lockDoor(n : Integer) is
   begin
      if((n = 1 or n = 2) and then sub.air(n) = Closed) then
         sub.air(n) := Locked;
      end if;
   end lockDoor;

end Coursework;
