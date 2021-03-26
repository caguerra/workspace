#!/usr/bin/env wolframscript

SetOptions[Developer`InstallFrontEnd, Developer`LaunchFlags -> "-display :5 -nogui -geometry 800x600+10+10 -defaultvisual"];

p = Graphics[Circle[]];

Echo[Directory[], "directory: "];
Export["circle.png", p];

Echo["Exporting done!"]
