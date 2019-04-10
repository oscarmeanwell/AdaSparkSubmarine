package Coursework with SPARK_mode
is
   type Airlock is (Open, Closed);
   type Oxegen is (Present, Absent, Low);
   type Status is (Submerged, Surfaced);
   type ReactorHeat is (Normal, Overheated);
   type Index is range 1 .. 2;
   type AirArray is array (Index) of Airlock;
   type Diving is (True, False);

   type Submarine is record
      air : AirArray;
      oxn : Oxegen;
      stat : Status;
      reac : ReactorHeat;
      dive : Diving;
   end record;

   sub : Submarine := (oxn => Present, stat => Surfaced, air => (Closed, Closed),
                       reac => Normal, dive => False);

   currentDepth : Integer := 0;

   procedure submergeSub with
     Global => (In_Out => sub),
     Pre => sub.air(1) = Closed and then sub.air(2) = Closed and then sub.oxn = Present,
     Post =>  sub.oxn = Present;

   procedure openAirlock with
     Global => (In_Out => sub),
     Pre => sub.air(1) = Closed and then sub.air(2) = Closed,
     Post =>  sub.air(1) = Closed or sub.air(2) = Closed;

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
     Pre => sub.stat = Submerged and then sub.oxn = Present and then sub.air(1) = Closed and then sub.air(2) = Closed,
     Post => sub.stat = Submerged;

   procedure closeAirlock with
     Global => (In_Out => sub),
     Pre => sub.stat = Submerged and then (sub.air(1) = Closed or sub.air(2) = Closed);

end Coursework;
