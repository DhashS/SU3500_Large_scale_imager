x1:=30.0
x2:=37.75
y1:=42.25
y2:=33.12
x_step:=0.08
y_step:=0.06
delay:=80		000





CoordMode, Mouse, Screen
;Convinience functions
MoveTo(name) {
    if (name == "Move") {
	MouseMove, 1645, 760
    }

    if (name == "X") {
	MouseMove, 1545, 735
    }

    if (name == "Y") {
	MouseMove, 1545, 770
    }

    if (name == "Capture") {
	MouseMove, 1175, 85
    }

}


Interpolate(v1, v2, step) {
    out_arr := Object()
    if (v2 < v1) {
	tmp := v1
	v1 := v2
	v2 := tmp
    }
    while (v1 <= v2) {
	out_arr.Insert(v1)
	v1 := v1 + step
    }
    return out_arr
}

SetStagePos(x, y) {
    MoveTo("X")
    Click
    Sleep, 10
    Send, ^a
    Sleep, 10
    Send, %x%
    Sleep, 100
    MoveTo("Y")
    Click
    Sleep, 10
    Send, ^a
    Sleep, 10
    Send, %y%
    Sleep, 100
    MoveTo("Move")
    Sleep, 100
    Click
    Sleep, 100
    Click, 10
    Sleep, 100
}

Capture(delay) {
    MoveTo("Capture")
    Sleep, 100
    Click
    Sleep, delay
}

;Main logic

for i, X in Interpolate(x1, x2, x_step) {
    for j, Y in Interpolate(y1, y2, y_step) {
	SetStagePos(X, Y)
	Sleep, 10000
	Capture(delay)	
    }
}