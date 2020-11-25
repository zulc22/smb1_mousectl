# SMB1 Mouse controls for FCEUX

Inspired by gruz's video about FCEUX's LUA scripting capabilities, I yet again cracked at a
script for controlling Super Mario with the mouse.

My previous attempts were years ago with BizHawk's (very similar, possibly compatible) LUA engine,
and were focused on SMB3, not SMB1.

Many memory locations were found at https://datacrystal.romhacking.net/wiki/Super_Mario_Bros.:RAM_map.

This script is UNTESTED WITH BIZHAWK, but I'm sure is completely functional on FCEUX, becuase
that's where I test it.

## To-do list

1. make it possible to climb vines
2. make it possible to enter pipes
3. detect luigi and switch back to normal controls
4. add compatibility with BizHawk