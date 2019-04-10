package Coursework with SPARK_mode
is
   type Airlock is (Open, Closed);
   type Oxegen is (Present, Absent, Low);
   type Status is (Submerged, Surfaced);
   type ReactorHeat is (Normal, Overheated);
   type Index is new Integer range 1 .. 2;
   type AirArray is array (Integer range 1 .. 2) of Airlock;
   type Diving is (True, False);
   type DoorLocked is (True, False);
   MAXDIVE : constant := 1000;

   type DiveRecord is record
      isDiving : Diving;
      maxDepth : Integer;
      currentDepth : Integer;
      safeDiveDepth : Integer;
   end record;

   type Submarine is record
      air : AirArray;
      oxn : Oxegen;
      stat : Status;
      reac : ReactorHeat;
      dive : DiveRecord;
   end record;

   diveR : DiveRecord := (isDiving => False, maxDepth => MAXDIVE, currentDepth => 0, safeDiveDepth => MAXDIVE - 100);

   sub : Submarine := (oxn => Present, stat => Surfaced, air => (Closed, Closed),
                       reac => Normal, dive => diveR);


   procedure submergeSub with
     Global => (In_Out => sub),
     Pre => sub.stat = Surfaced and then sub.air(1) = Closed and then sub.air(2) = Closed
         and then sub.oxn = Present and then sub.reac = Normal,
     Post =>  sub.stat = Submerged and then sub.air(1) = Closed and then sub.air(2) = Closed;

   procedure surfaceSub with
     Global => (In_Out => sub),
     Pre => sub.stat = Submerged and then sub.air(1) = Closed and then sub.air(2) = Closed,
     Post => sub.stat = Surfaced and then sub.air(1) = Closed and then sub.air(2) = Closed;

   procedure checkOxg with
     Global => (In_Out => sub),
     Pre => sub.air(1) = Closed and then sub.air(2) = Closed;

   procedure checkReactor with
     Global => (In_Out => sub),
     Pre => sub.stat = Submerged and then sub.air(1) = Closed and then sub.air(2) = Closed;


   procedure diveSub with
     Global => (In_Out => sub),
     Pre => sub.stat = Submerged and then sub.oxn = Present and then sub.air(1) = Closed
         and then sub.air(2) = Closed and then sub.dive.currentDepth < sub.dive.safeDiveDepth
         and then sub.dive.currentDepth < Integer'Last-100,
     Post => sub.stat = Submerged and then sub.dive.currentDepth > sub.dive.currentDepth'Old;

   procedure closeAirlock(n : Integer) with
     Global => (In_Out => sub),
     Pre => (n = 1 or n = 2) and then sub.stat = Submerged and then (sub.air(1) = Open xor sub.air(2) = Open),
     Post => sub.air(n) = Closed;

   procedure openAirlock(n : Integer) with
     Global => (In_Out => sub),
     Pre => (n = 1 or n = 2) and then sub.air(1) = Closed and then sub.air(2) = Closed,
     Post =>  sub.air(n) = Open;

end Coursework;
