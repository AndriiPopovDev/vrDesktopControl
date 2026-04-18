; =================================================================
; MOUSE WHEEL GESTURES (MX MASTER STYLE)
; Description: Hold Middle Mouse Button (Wheel) to swipe. 
; Quick click still works for browser tabs.
; =================================================================

#NoEnv
#SingleInstance Force
SetBatchLines, -1
SendMode Input

MButton::
    ; Record the starting mouse position
    MouseGetPos, x1, y1
    
    ; Wait for button release (T0.2 defines the hold threshold)
    ; This allows normal middle-clicks in browsers
    KeyWait, MButton, T0.15 
    
    if (ErrorLevel) ; Button was held (Gesture Mode)
    {
        KeyWait, MButton
        MouseGetPos, x2, y2
        
        diffX := x2 - x1
        diffY := y2 - y1
        threshold := 15 ; High sensitivity
        
        ; --- DIAGONAL GESTURES ---
        ; diagonal swipe up-right -> open file explorer
        if (diffX > threshold && diffY < -threshold)
        {
            Run, explorer.exe
            return
        }
        ; diagonal swipe up-left -> close app
        if (diffX < -threshold && diffY < -threshold) {
            Send !{F4} ; Up-Left: Close App
            return
        }

        ; --- STANDART GESTURES ---
        if (Abs(diffX) > Abs(diffY)) 
        {
            ; --- HORIZONTAL GESTURES SWITCH VIRTUAL DESK ---
            if (diffX > threshold)
                Send ^#{Right} ; Swipe Right: Next Virtual Desktop
            else if (diffX < -threshold)
                Send ^#{Left}  ; Swipe Left: Previous Virtual Desktop
        }
        else 
        {
            ; --- VERTICAL GESTURES  UP - TASK VIEW, DOWN - HIDE/UNHIDE WINDOWS---
            if (diffY < -threshold)
                Send #{Tab}    ; Swipe Up: Task View
            else if (diffY > threshold)
                Send #d        ; Swipe Down: Show/Hide Desktop
        }
        return
    }
    else ; Button was released quickly (Normal Middle Click)
    {
        Click, Middle
    }
return

; Emergency toggle: Ctrl + Alt + S to suspend/resume script
^!s::Suspend