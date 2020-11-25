emu.poweron();

--[[ TODO:

1. make it possible to climb vines
2. make it possible to enter pipes
3. detect luigi and switch back to normal controls
4. add compatibility with BizHawk

]]--

-- To disable this splash, change the line below to say "splash=false".
splash=true;

if splash then
    for i=0,1,(1/720) do -- Lasts 720 frames (12 seconds)

        -- text moves left over time
        gui.drawtext(i*-960+256,48,"SMB1 Mouse Control Script v2 (WIP) by zulc22, 2020. Leftclick = A, Middleclick = B. Script will automatically press start during the demo.");
        emu.frameadvance();

    end;
end;

while (true) do
    
    if ( memory.readbyte(0x770) == 0x0 ) then
        gui.drawtext(16,16,"Cutscene detected! Now spamming start.");
        joypad.set(1, {start=true});
        emu.frameadvance();
        gui.drawtext(16,16,"Cutscene detected! Now spamming start.");
        emu.frameadvance();
    else if (memory.readbyte(0xE) == 0x08) then
    
    mouse = input.get();
    mariox = memory.readbyte(0x03AD) + 8;

    ----Draw mario's x pos and the mouse's x pos for debugging
    --gui.drawLine(mariox, 0, mariox, 256, "red");
    --gui.drawLine(mouse.X, 0, mouse.X, 256, "green");

    -- Decide which direction to move. (jpset, mouse are incompatible with BizHawk)
    jpset = {};
    if (mariox < mouse.xmouse) then
        jpset.right = true;
    end;
    if (mariox > mouse.xmouse) then
        jpset.left = true;
    end;

    jpset.A=mouse.leftclick;
    jpset.B=mouse.middleclick;

    gui.drawline(mouse.xmouse-4,mouse.ymouse,mouse.xmouse+4,mouse.ymouse,"red");
    gui.drawline(mouse.xmouse,mouse.ymouse-4,mouse.xmouse,mouse.ymouse+4,"red");
    
    if (mouse.leftclick) then gui.drawpixel(mouse.xmouse-4,mouse.ymouse-6,"red") end;
    if (mouse.middleclick) then gui.drawpixel(mouse.xmouse, mouse.ymouse-6,"red") end;

    joypad.set(1, jpset);

end;
emu.frameadvance();
end;
end;