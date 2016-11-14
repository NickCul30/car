%FINAL PROJECT
%CAR TURING CODE

var x5: array 1..4 of int :=init(0,0,640,640)
var y5 :array 1..4 of int :=init(0,400,400,0)
drawfillpolygon(x5,y5,4,35)

var x1: array 1..3 of int :=init(115,160,205)
var y1 :array 1..3 of int :=init(140,60,140)
drawfillpolygon(x1,y1,3,55)

var x2: array 1..3 of int :=init(115,160,205)
var y2 :array 1..3 of int :=init(260,340,260)
drawfillpolygon(x2,y2,3,55)

var x3: array 1..3 of int :=init(100,20,100)
var y3 :array 1..3 of int :=init(150,205,250)
drawfillpolygon(x3,y3,3,55)

var x4: array 1..3 of int :=init(220,300,220)
var y4 :array 1..3 of int :=init(150,205,250)
drawfillpolygon(x4,y4,3,55)

var x6: array 1..4 of int :=init(380,380,620,620)
var y6 :array 1..4 of int :=init(230,360,360,230)
drawfillpolygon(x6,y6,4,55)

var x7: array 1..4 of int :=init(380,380,620,620)
var y7 :array 1..4 of int :=init(30,181,181,30)
drawfillpolygon(x7,y7,4,55)

var horn : int
horn := Pic.FileNew("hornicon.jpg")

var nos : int
nos := Pic.FileNew("nosicon.jpg")


var fanflag : int
var lightcount : int
var chars : array char of boolean
var output : int
var backward : int
var turning : int

lightcount := 0
output := 0
fanflag := 0
backward := 0
turning := 0

Pic.Draw(horn, 400, 50, picCopy) 
Pic.Draw(nos, 400, 250, picCopy) 

loop
    Input.KeyDown (chars)
    
    %D0 & D1 go to the right wheels motor
    %D2 & D3 go to the left wheels motor
    %D4 right LED
    %D5 left LED
    %D6 NOS Booster (Fan)
    %D7 Horn
    
    %Prevents spam if up & down or left & right are pressed together
    %Both motors inactive
    
    turning := 0
    drawfillpolygon(x6,y6,4,55)
    drawfillpolygon(x7,y7,4,55)
    
    if chars (KEY_UP_ARROW) and chars (KEY_DOWN_ARROW) or chars (KEY_RIGHT_ARROW) and chars (KEY_LEFT_ARROW) then
	output := 0
	drawfillpolygon(x1,y1,3,55)
	drawfillpolygon(x2,y2,3,55)
	drawfillpolygon(x3,y3,3,55)
	drawfillpolygon(x4,y4,3,55)
	backward := 0
    
    %right motor forward, left motor inactive; turns left
    elsif chars (KEY_UP_ARROW) and chars (KEY_LEFT_ARROW) then
	output := output + 1
	drawfillpolygon(x2,y2,3,53)
	drawfillpolygon(x1,y1,3,55)
	drawfillpolygon(x3,y3,3,53)
	drawfillpolygon(x4,y4,3,55)
	backward := 0
    
    %left motor forward, right motor inactive; turns right
    elsif chars (KEY_UP_ARROW) and chars (KEY_RIGHT_ARROW) then
	output := output + 4
	drawfillpolygon(x2,y2,3,53)
	drawfillpolygon(x1,y1,3,55)
	drawfillpolygon(x3,y3,3,55)
	drawfillpolygon(x4,y4,3,53)
	backward := 0
	
    %right motor backward, left motor inactive; turns left backward
    elsif chars (KEY_DOWN_ARROW) and chars (KEY_LEFT_ARROW) then
	output := output + 2
	drawfillpolygon(x2,y2,3,55)
	drawfillpolygon(x1,y1,3,53)
	drawfillpolygon(x3,y3,3,53)
	drawfillpolygon(x4,y4,3,55)
	backward := 0
	turning := 1
	
	if lightcount < 10 then
	    output := output + 176
	    drawfillpolygon(x7,y7,4,53)
	end if
	
    %left motor backward, right motor inactive; turns right backward   
    elsif chars (KEY_DOWN_ARROW) and chars (KEY_RIGHT_ARROW) then
	output := output + 8
	drawfillpolygon(x2,y2,3,55)
	drawfillpolygon(x1,y1,3,53)
	drawfillpolygon(x3,y3,3,55)
	drawfillpolygon(x4,y4,3,53)
	backward := 0
	turning := 1
	
	if lightcount < 10 then
	    output := output + 176
	    drawfillpolygon(x7,y7,4,53)
	end if
    
    %both motors forward; goes forward   
    elsif chars (KEY_UP_ARROW) then
	output := output + 5
	drawfillpolygon(x2,y2,3,53)
	drawfillpolygon(x1,y1,3,55)
	drawfillpolygon(x3,y3,3,55)
	drawfillpolygon(x4,y4,3,55)
	backward := 0
    
    %both motors backward; goes backwards    
    elsif chars (KEY_DOWN_ARROW) then
	output := output + 10
	drawfillpolygon(x2,y2,3,55)
	drawfillpolygon(x1,y1,3,53)
	drawfillpolygon(x3,y3,3,55)
	drawfillpolygon(x4,y4,3,55)
	backward := 0
	turning := 1
	
	if lightcount < 10 then
	    output := output + 176
	    drawfillpolygon(x7,y7,4,53)
	end if
    
    %left motor backward, right motor forward; turns sharply left
    elsif chars (KEY_LEFT_ARROW) then
	output := output + 9
	drawfillpolygon(x2,y2,3,55)
	drawfillpolygon(x1,y1,3,55)
	drawfillpolygon(x3,y3,3,53)
	drawfillpolygon(x4,y4,3,55)
	backward := 0
	turning := 1
	
	if lightcount < 10 then
	    output := output + 32
	end if
    
    %right motor backward, left motor forward; turns sharply right    
    elsif chars (KEY_RIGHT_ARROW) then
	output := output + 6
	drawfillpolygon(x2,y2,3,55)
	drawfillpolygon(x1,y1,3,55)
	drawfillpolygon(x3,y3,3,55)
	drawfillpolygon(x4,y4,3,53)
	backward := 0
	turning := 1
	
	if lightcount < 10 then
	    output := output + 16
	end if
	
    else
	output := output + 0
	drawfillpolygon(x1,y1,3,55)
	drawfillpolygon(x2,y2,3,55)
	drawfillpolygon(x3,y3,3,55)
	drawfillpolygon(x4,y4,3,55)
    end if
    
    if chars (' ') and output < 128 then
	output := output + 128
	drawfillpolygon(x7,y7,4,53)
    end if
    
    if chars (KEY_ENTER) then
	if fanflag = 0 then
	    fanflag := 1
	elsif fanflag = 1 then
	    fanflag := 0
	end if
	
    end if
	
    
    if fanflag = 1 then
	output := output + 64
	drawfillpolygon(x6,y6,4,53)
    end if

    if parallelget = 88 then
	backward := 1
    end if
	
    if backward = 1 then
	output := 10
	drawfillpolygon(x2,y2,3,55)
	drawfillpolygon(x1,y1,3,40)
	drawfillpolygon(x3,y3,3,55)
	drawfillpolygon(x4,y4,3,55)
	
	if lightcount < 10 then
	    output := output + 176
	end if
    end if
    
    if turning = 0 and backward = 0 then
	output := output + 48
    end if
    
    
    if turning = 0 and backward = 0 and parallelget = 104 then
	output := output - 48
    end if
    
    
    %=============================
    
    %put output

    lightcount := lightcount + 1
    
    if lightcount = 20 then
	lightcount := 0
    end if
    
    Pic.Draw(horn, 400, 50, picCopy) 
    Pic.Draw(nos, 400, 250, picCopy)

    delay(100)
    parallelput(output)
    output := 0
    
end loop
