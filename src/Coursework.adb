package body Coursework with SPARK_Mode
is

   procedure submergeSub is
   begin
      if(sub.air(1) = Locked and then sub.air(2) = Locked and then sub.oxn /= Absent and then sub.reac = Normal) then
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

   procedure overideOxegen(d : String) is
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

   end overideOxegen;

   procedure overideReactor is
      --Check the reactor
   begin
      if(sub.reac = Normal and then sub.stat = Submerged and then
         sub.air(1) = Locked and then sub.air(2) = Locked) then
         surfaceSub;
         sub.reac := Overheated;
      end if;
   end overideReactor;


   procedure diveSub is
   begin
      if(sub.stat = Submerged and then sub.oxn = Present and then sub.air(1) = Locked
         and then sub.air(2) = Locked and then sub.dive.currentDepth < sub.dive.safeDiveDepth and then sub.reac = Normal) then
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

   procedure loadTorpedeo(n : Integer) is
   begin
      if(n >= 1 and then n <= 4 and then sub.air(1) = Locked and then sub.air(2) = Locked
         and then sub.tor.slots(n) = Empty and then sub.tor.numberOfTorepedos > 0) then
         sub.tor.slots(n) := Loaded;
         sub.tor.numberOfTorepedos := sub.tor.numberOfTorepedos - 1;
      end if;
   end loadTorpedeo;

   procedure fireTorpedeo(n : Integer) is
   begin
      if(n >= 1 and then n <= 4 and then sub.air(1) = Locked and then sub.air(2) = Locked
         and then sub.tor.slots(n) = Loaded and then sub.stat = Submerged) then
         -- Fire!
         sub.tor.slots(n) := Empty;

      end if;

   end fireTorpedeo;

end Coursework;
