with Coursework; use Coursework;
with Ada.Text_IO; use Ada.Text_IO;


procedure Main is
simulationActive : Boolean := True;
inp : String (1..1);
last : Integer := 80;
t1 : string :=   "   _____       _                          _               _____            _             _   _____                 _ " ;
t2 : string :=   "  / ____|     | |                        (_)             / ____|          | |           | | |  __ \               | |" ;
t3 : string :=   " | (___  _   _| |__  _ __ ___   __ _ _ __ _ _ __   ___  | |     ___  _ __ | |_ _ __ ___ | | | |__) |_ _ _ __   ___| |" ;
t4 : string :=   "  \___ \| | | | '_ \| '_ ` _ \ / _` | '__| | '_ \ / _ \ | |    / _ \| '_ \| __| '__/ _ \| | |  ___/ _` | '_ \ / _ \ |" ;
t5 : string :=   "  ____) | |_| | |_) | | | | | | (_| | |  | | | | |  __/ | |___| (_) | | | | |_| | | (_) | | | |  | (_| | | | |  __/ |";
t6 : string :=   " |_____/ \__,_|_.__/|_| |_| |_|\__,_|_|  |_|_| |_|\___|  \_____\___/|_| |_|\__|_|  \___/|_| |_|   \__,_|_| |_|\___|_|";


procedure printSub is
   begin
      New_Line;New_Line;
      Put_Line("Submarine is (1): " & sub.stat'Image);
      Put_Line("   Doors are (2): " & sub.air(1)'Image & ", " & sub.air(2)'Image);
      Put_Line("  Reactor is (3): " & sub.reac'Image);
      Put_Line("   Oxegen is (4): " & sub.oxn'Image);
      Put_Line("    Depth is (5): " & sub.dive.currentDepth'Image);
      Put("   Torpedoes (6): ");
      Put(sub.tor.slots(1)'Image & ", " & sub.tor.slots(2)'Image & ", ");
      Put_Line(sub.tor.slots(3)'Image & ", " & sub.tor.slots(4)'Image);

   end printSub;
begin
   Put_Line(t1); Put_Line(t2); Put_Line(t3); Put_Line(t4); Put_Line(t5); Put_Line(t6);
   New_Line; New_Line;
   Put_Line("1 = Surface/Submerge, 2 = Doors, 3 = Reactor, 4 = Oxegen, 5 = Dive, 6 = Torpedoes, 7 = Quit");

   while simulationActive loop
      printSub;
      Put_Line("");
      Put("Enter a command: ");
      Get(inp);

      if(inp = "1") then
         Put("    Sub is currently: ");
         Put_Line(sub.stat'Image);
         Put("    Submerge (d), Surface (u): ");
         Get(inp);
         if(inp = "d") then
            Put_Line("    Attempting to submerge");
            submergeSub;
         end if;

         if(inp = "u") then
            Put_Line("    Attempting to surface");
            surfaceSub;
         end if;

      elsif(inp = "4") then
         Put("    Overide to Low (1), Normal (2), Run Out (3)): ");
         Get(inp);
         if(inp = "1") then
            Put_Line("    Oxegen is LOW!");
            overideOxegen("Low");
         end if;
         if(inp = "2") then

            overideOxegen("Present");
         end if;
         if(inp = "3") then

            overideOxegen("Absent");
         end if;

      elsif(inp = "3") then
         Put("    Reactor overheated(1), normal (2): ");
         Get(inp);
         if(inp = "1") then
            overideReactor;
         end if;
         if(inp = "2") then
            sub.reac := Normal;
         end if;

      elsif(inp = "5") then
         Put_Line("    Attempting to dive");
         diveSub;

      elsif(inp = "2") then
         Put("    Open or Close Airlock doors (1), Lock doors (2): ");
         Get(inp);
         if(inp = "1") then
            Put("    Open airlock (o), Close Airlock (c): ");
            Get(inp);
            if(inp = "o") then
               Put("    Airlock Number (1, 2): ");
               Get(inp);
               Put("    Attempting to Open Airlock ");
               Put_Line(inp);
               openAirlock(Integer'Value(inp));
            end if;

            if(inp = "c") then
               Put("    Airlock Number (1, 2): ");
               Get(inp);
               Put("    Attempting to Close Airlock ");
               Put_Line(inp);
               closeAirlock(Integer'Value(inp));
            end if;
         --end if;
         elsif(inp = "2") then
            Put("    Lock door number (1,2): ");
            Get(inp);
            Put("Attempting to lock door ");
            Put_Line(inp);
            lockDoor(Integer'Value(inp));
         end if;


      elsif(inp = "6") then
         Put_Line("    Unloaded Torpedoes Remaining: " & sub.tor.numberOfTorepedos'Image);
         Put("    Load = 1, Fire = 2: ");
         Get(inp);
         if(inp = "1") then
            Put("    Enter Slot Number: ");
            Get(inp);
            Put_Line("Attempting to load torpedo to slot " & inp);
            loadTorpedeo(Integer'Value(inp));

         elsif(inp = "2") then
            Put("    Enter Slot Number: ");
            Get(inp);
            Put_Line("Attempting to fire torpedo from slot " & inp);
            fireTorpedeo(Integer'Value(inp));
         end if;

      elsif(inp = "7") then
         simulationActive := False;
      end if;
   end loop;
end Main;
