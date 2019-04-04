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
      Put(airlocks.airlocksA(1)'Image);
      Put(" and ");
      Put_Line(airlocks.airlocksA(2)'Image);
      Put("  Reactor is: ");
      Put_Line(sub.reac'Image);
      Put("   Oxegen is: ");
      Put_Line(sub.oxn'Image);
      Put("   Diving is: ");
      Put_Line(sub.dive'Image);

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
   Put_Line("1 = Surface/Submerge, 2 = Oxegen, 3 = Reactor, 4 = Dive, 5 = Open Airlock, 6 = Fire Missile, 7 = Quit");

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
            Put_Line("    Trying to submerge");
            submergeSub;
         end if;

         if(inp = "u") then
            Put_Line("    Trying to surface");
            surfaceSub;
         end if;

      end if;
      if(inp = "2") then
         Put("    Oxegen Level is currently: ");
         Put_Line(sub.oxn'Image);
         Put("    Overide to Low (l): ");
         Get(inp);
         if(inp = "l") then
            sub.oxn := Low;
            checkOxg;
         end if;
      end if;
      if(inp = "3") then
         Put_Line("test");
      end if;
      if(inp = "4") then
         Put_Line("test");
      end if;
      if(inp = "5") then
         Put("    Open airlock (o), Close Airlock (c): ");
         Get(inp);
         if(inp = "o") then
            Put_Line("    Opening Airlock");
            openAirlock;
         end if;

         if(inp = "c") then
            Put_Line("    Closing Airlock");
            closeAirlock;
         end if;

      end if;
      if(inp = "6") then
         Put_Line("test");
      end if;
      if(inp = "7") then
         simulationActive := False;
      end if;
   end loop;
end Main;


