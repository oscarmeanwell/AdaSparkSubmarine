package Coursework with SPARK_mode
is
   type Airlock is (Open, Closed, Locked);
   type Oxegen is (Present, Absent, Low);
   type Status is (Submerged, Surfaced);
   type ReactorHeat is (Normal, Overheated);
   type AirArray is array (Integer range 1 .. 2) of Airlock;
   type Diving is (True, False);
   type DoorLocked is (True, False);
   type IsLoaded is (Empty, Loaded);
   type TorArray is array (Integer range 1 .. 4) of IsLoaded;

   MAXDIVE : constant := 1000;

   type DiveRecord is record
      isDiving : Diving;
      maxDepth : Integer;
      currentDepth : Integer;
      safeDiveDepth : Integer;
   end record;

   type TorepedoRecord is record
      numberOfTorepedos : Integer;
      slots: TorArray;
   end record;

   type Submarine is record
      air : AirArray;
      oxn : Oxegen;
      stat : Status;
      reac : ReactorHeat;
      dive : DiveRecord;
      tor: TorepedoRecord;
   end record;

   diveR : DiveRecord := (isDiving => False, maxDepth => MAXDIVE, currentDepth => 0, safeDiveDepth => MAXDIVE - 100);

   torR : TorepedoRecord := (numberOfTorepedos => 15, slots => (Empty, Loaded, Loaded, Empty));

   sub : Submarine := (oxn => Present, stat => Surfaced, air => (Locked, Locked),
                       reac => Normal, dive => diveR, tor => torR);

   procedure submergeSub with
     Global => (In_Out => sub),
     Pre => sub.stat = Surfaced and then sub.air(1) = Locked and then sub.air(2) = Locked
         and then sub.oxn /= Absent and then sub.reac = Normal,
     Post =>  sub.stat = Submerged and then sub.air(1) = Locked and then sub.air(2) = Locked;

   procedure surfaceSub with
     Global => (In_Out => sub),
     Pre => sub.stat = Submerged and then sub.air(1) = Locked and then sub.air(2) = Locked,
     Post => sub.stat = Surfaced and then sub.air(1) = Locked and then sub.air(2) = Locked;

   procedure overideOxegen(d : String) with
     Global => (In_Out => sub),
     Pre => sub.air(1) = Locked and then sub.air(2) = Locked;

   procedure overideReactor with
     Global => (In_Out => sub),
     Pre => sub.reac = Normal and then sub.stat = Submerged and then sub.air(1) = Locked and then sub.air(2) = Locked,
     Post => sub.reac = Overheated;

   procedure diveSub with
     Global => (In_Out => sub),
     Pre => sub.stat = Submerged and then sub.oxn = Present and then sub.air(1) = Locked
     and then sub.air(2) = Locked and then sub.dive.currentDepth < sub.dive.safeDiveDepth
     and then sub.reac = Normal and then sub.dive.currentDepth < Integer'Last-100
     and then sub.dive.currentDepth+100 <= sub.dive.maxDepth,
     Post => sub.dive.currentDepth > sub.dive.currentDepth'Old and then sub.dive.currentDepth <= sub.dive.maxDepth;

   procedure closeAirlock(n : Integer) with
     Global => (In_Out => sub),
     Pre => (n = 1 or n = 2) and then sub.air(n) = Open,
     Post => sub.air(n) = Closed and then (for all I in sub.air'Range => (if I /= n then sub.air(I) = sub.air'Old(I)));

   procedure openAirlock(n : Integer) with
     Global => (In_Out => sub),
     Pre => (n = 1 or n = 2) and then (sub.air(1) = Closed or sub.air(1) = Locked)
         and then (sub.air(2) = Closed or sub.air(2) = Locked),
     Post =>  sub.air(n) = Open and then (for all I in sub.air'Range => (if I /= n then sub.air(I) = sub.air'Old(I)));

   procedure lockDoor(n : Integer) with
     Global => (In_Out => sub),
     Pre => (n = 1 or n = 2) and then sub.air(n) = Closed,
     Post => sub.air(n) = Locked and then
         (for all I in sub.air'Range => (if I /= n then sub.air(I) = sub.air'Old(I)));

   procedure loadTorpedeo(n : Integer) with
     Global => (In_Out => sub),
     Pre => n >= 1 and then n <= 4 and then sub.air(1) = Locked and then sub.air(2) = Locked
         and then sub.tor.slots(n) = Empty and then sub.tor.numberOfTorepedos > 0,
     Post => sub.tor.slots(n) = Loaded
         and then sub.tor.numberOfTorepedos < sub.tor.numberOfTorepedos'Old
         and then (for all I in sub.tor.slots'Range => (if I /= n then sub.tor.slots(I) = sub.tor.slots'Old(I)))
         and then sub.tor.slots(n) /= sub.tor.slots'Old(n);

   procedure fireTorpedeo(n : Integer) with
     Global => (In_Out => sub),
     Pre => n >= 1 and then n <= 4 and then sub.air(1) = Locked and then sub.air(2) = Locked
        and then sub.tor.slots(n) = Loaded and then sub.stat = Submerged,
     Post => sub.tor.slots(n) = Empty and then (for all I in sub.tor.slots'Range => (if I /= n then sub.tor.slots(I) = sub.tor.slots'Old(I)));
end Coursework;
