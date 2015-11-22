% HNMR Drawing Aid by Brinda Venkataramani
% Does not support peak splitting yet.
% Enables the user to first draw single peaks present on their HNMR spectrum, and then mouseover to check which functional groups may be present.
% To use, simply draw all your peaks, then press the spacebar to enter the main mouseover loop.
% No-nonsense, plain-text, tiny, standalone application; no assets required -- just launch and use.
% Version 1.0; 120 lines of code.

Draw.Line (30, 70, 615, 70, black)
Draw.Line (615, 70, 615, 350, black)
locate (23, 7)
put "11.0  10.0   9.0    8.0   7.0   6.0   5.0    4.0   3.0   2.0   1.0   0.0"
locate (24, 30)
put "Chemical Shift (ppm)"
locate (2, 76)
put "TMS"

var x := 615

loop
    Draw.Line (x, 60, x, 80, black)
    exit when x = 65
    x := x - 50
end loop

var mx,my,c : int
var userInput : array char of boolean
var peaks : array char of boolean

% Drawing loop. Enables user to plot peaks.
% To exit just press the spacebar.
% Program will enter main loop.
% Note that for the time being, no peak splitting is enabled.
% All peaks are same height.
% Plans to implement peak splitting functionality.
% Implemented peaks function. (Until quintets.)

loop
    Input.KeyDown(userInput)
    mousewhere(mx,my,c)
    if c = 1 then
        Input.KeyDown(peaks)
        if peaks ('1') then
            Draw.Line(mx,70,mx,300,black)
        elsif peaks ('2') then
            Draw.Line(mx+1,70,mx+1,200,black)
            Draw.Line(mx-1,70,mx-1,200,black)
        elsif peaks ('3') then
            Draw.Line(mx,70,mx,200,black)
            Draw.Line(mx+2,70,mx+2,150,black)
            Draw.Line(mx-2,70,mx-2,150,black)
        elsif peaks ('4') then
            Draw.Line(mx+1,70,mx+1,150,black)
            Draw.Line(mx-1,70,mx-1,150,black)
            Draw.Line(mx+3,70,mx+3,100,black)
            Draw.Line(mx-3,70,mx-3,100,black)
        elsif peaks ('5') then
            Draw.Line(mx,70,mx,125,black)
            Draw.Line(mx+2,70,mx+2,100,black)
            Draw.Line(mx-2,70,mx-2,100,black)
            Draw.Line(mx+4,70,mx+4,85,black)
            Draw.Line(mx-4,70,mx-4,85,black)
        end if
    end if 
    exit when userInput(chr(32))
end loop

% Main mouseover loop. Aids the user in determining functional groups present in their spectrum.
% Note that overwriting occurs due to region overlap. (Working on this.)
% Every 5 pixels is 0.1 shift. (Technical note.)

loop
    mousewhere(mx,my,c)
    if mx > 565 and mx < 575 then
        locate(1,2)
        put "primary alkyl (0.8-1.0)"
    elsif mx > 545 and mx < 555 then
        locate(1,2)
        put "secondary alkyl (1.2-1.4)"   
    elsif mx > 530 and mx < 545 then
        locate(1,2)
        put "tertiary alkyl (1.4-1.7)" 
    elsif mx > 490 and mx < 505 then
        locate(1,2)
        put "benzylic (2.2-2.5)"
    elsif mx > 425 and mx < 435 then
        locate(1,2)
        put "alkyl chloride (3.6-3.8)"
    elsif mx > 435 and mx < 445 then
        locate(1,2)
        put "alkyl bromide (3.4-3.6)"  
    elsif mx > 450 and mx < 460 then
        locate(1,2)
        put "alkyl iodide (3.1-3.3)" 
    elsif mx > 390 and mx < 415 then
        locate(1,2)
        put "alkyl fluoride (4.0-4.5)" 
    elsif mx > 420 and mx < 450 then
        locate(1,2)
        put "ether or ester (3.3-3.9)" 
    elsif mx > 415 and mx < 435 then
        locate(1,2)
        put "alcohol adjacent (3.3-4.0)"
    elsif mx > 585 and mx < 510 then
        locate(1,2)
        put "ketone (2.1-2.6)"
    elsif mx > 115 and mx < 165 then
        locate(1,2)
        put "aldehyde (9.0-10.0)" 
    elsif mx > 425 and mx < 435 then
        locate(1,2)
        put "alkyl chloride" 
    end if
end loop
