with Coursework; use Coursework;
with Ada.Text_IO; use Ada.Text_IO;


procedure Main is
simulationActive : Boolean := True;
inp : String (1..1);
last : Integer := 80;
title : string :=    "   _____       _                          _               _____            _             _   _____                 _ " ;
title1 : string :=   "  / ____|     | |                        (_)             / ____|          | |           | | |  __ \               | |" ;
title2 : string :=   " | (___  _   _| |__  _ __ ___   __ _ _ __ _ _ __   ___  | |     ___  _ __ | |_ _ __ ___ | | | |__) |_ _ _ __   ___| |" ;
title3 : string :=   "  \___ \| | | | '_ \| '_ ` _ \ / _` | '__| | '_ \ / _ \ | |    / _ \| '_ \| __| '__/ _ \| | |  ___/ _` | '_ \ / _ \ |" ;
title4 : string :=   "  ____) | |_| | |_) | | | | | | (_| | |  | | | | |  __/ | |___| (_) | | | | |_| | | (_) | | | |  | (_| | | | |  __/ |";
title5 : string :=   " |_____/ \__,_|_.__/|_| |_| |_|\__,_|_|  |_|_| |_|\___|  \_____\___/|_| |_|\__|_|  \___/|_| |_|   \__,_|_| |_|\___|_|";
procedure printSub is
   begin
      Put_Line("");
      Put_Line("");
      Put("Submarine is: ");
      Put_Line(sub.stat'Image);
      Put("Airlocks are: ");
      Put(sub.air(1)'Image);
      Put(" and ");
      Put_Line(sub.air(2)'Image);
      Put("  Reactor is: ");
      Put_Line(sub.reac'Image);
      Put("   Oxegen is: ");
      Put_Line(sub.oxn'Image);
      Put("   Depth is: ");
      Put_Line(sub.dive.currentDepth'Image);

   end printSub;
begin
   Put_Line(title);
   Put_Line(title1);
   Put_Line(title2);
   Put_Line(title3);
   Put_Line(title4);
   Put_Line(title5);
   Put_Line("");
   Put_Line("");
   Put_Line("1 = Surface/Submerge, 2 = Oxegen, 3 = Reactor, 4 = Dive, 5 = Open Airlock, 6 = Lock Door, 7 = Fire Missile, 8 = Quit");

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

      elsif(inp = "2") then
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
            sub.reac := Overheated;
            overideReactor;
         end if;
         if(inp = "2") then
            sub.reac := Normal;
         end if;

      elsif(inp = "4") then
         Put_Line("    Attempting to dive");
         diveSub;

      elsif(inp = "5") then
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

      elsif(inp = "6") then
         Put("    Lock door number (1,2): ");
         Get(inp);
         Put("Attempting to lock door ");
         Put_Line(inp);
         lockDoor(Integer'Value(inp));

      elsif(inp = "7") then
         Put_Line("test");

      elsif(inp = "8") then
         simulationActive := False;
      end if;
   end loop;
end Main;


