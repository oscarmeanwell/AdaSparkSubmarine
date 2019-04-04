package Coursework with SPARK_mode
is
   type Airlock is (Open, Closed);
   type Oxegen is (Present, Absent, Low);
   type Status is (Submerged, Surfaced);
   type OpertationAllowed is (True, False);
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

   type AcionPermitted is record
      airlocksA : AirArray;
      allowed : OpertationAllowed;
   end record;

   airlocks : AcionPermitted := (airlocksA => (Closed, Closed), allowed => False);

   sub : Submarine := (oxn => Present, stat => Surfaced, air => airlocks.airlocksA, reac => Normal, dive => False);

   procedure operationPermitted with
     Global => (In_Out => airlocks),
     Pre => airlocks.airlocksA(1) = Closed and then airlocks.airlocksA(2) = Closed,
     Post => airlocks.airlocksA(1) = Closed and then airlocks.airlocksA(2) = Closed;


   procedure submergeSub with
     Global => (In_Out => sub, Input => airlocks),
     Pre => airlocks.allowed = True and sub.oxn = Present,
     Post =>  sub.oxn = Present and then airlocks.allowed = True;

   procedure openAirlock with
     Global => (In_Out => airlocks),
     Pre => airlocks.airlocksA(1) = Closed and then airlocks.airlocksA(2) = Closed,
     Post =>  airlocks.airlocksA(1) = Closed or airlocks.airlocksA(2) = Closed;

   procedure surfaceSub with
     Global => (In_Out => sub),
     Pre => sub.stat = Submerged,
     Post => sub.stat = Surfaced;

   procedure checkOxg with
     Global => (In_Out => sub);

   procedure checkReactor with
     Global => (In_Out => sub),
     Pre => sub.stat = Submerged;


   procedure diveSub with
     Global => (In_Out => sub),
     Pre => sub.stat = Submerged and then sub.oxn = Present and then airlocks.allowed = True,
     Post => sub.stat = Submerged;

end Coursework;
