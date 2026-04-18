; =================================================================
; MOUSE WHEEL GESTURES (MX MASTER STYLE) - REFINED DIAGONALS
; Description: Hold Middle Mouse Button (Wheel) to swipe. 
; Quick click still works for browser tabs.
; =================================================================

#NoEnv
#SingleInstance Force
SetBatchLines, -1
SendMode Input

; --- SETTINGS ---
threshold := 25      ; Minimal movement for a gesture
diagonal_ratio := 0.6 ; Balance ratio (higher = stricter diagonals)

MButton::
    ; Record the starting mouse position
    MouseGetPos, x1, y1
    
    ; Hold threshold (T0.15 allows normal middle-clicks)
    KeyWait, MButton, T0.15 
    
    if (ErrorLevel) ; Button was held (Gesture Mode)
    {
        KeyWait, MButton
        MouseGetPos, x2, y2
        
        diffX := x2 - x1
        diffY := y2 - y1
        absX := Abs(diffX)
        absY := Abs(diffY)
        
        ; Ignore if movement is too small
        if (absX < threshold && absY < threshold)
            return

        ; --- DIAGONAL LOGIC WITH PRECISION CHECK ---
        ; Diagonal triggers only if X and Y movements are somewhat equal
        ; absX/absY ratio should be between diagonal_ratio and 1/diagonal_ratio
        if (absX > threshold && absY > threshold && absX * diagonal_ratio < absY && absY * diagonal_ratio < absX)
        {
            if (diffX > 0 && diffY < 0) {
                Run, explorer.exe ; Up-Right: File Explorer
                return
            }
            if (diffX < 0 && diffY < 0) {
                Send !{F4}         ; Up-Left: Close App
                return
            }
        }

        ; --- STANDARD GESTURES ---
        if (absX > absY) 
        {
            ; Horizontal focus
            if (diffX > 0)
                Send ^#{Right} ; Swipe Right: Next Virtual Desktop
            else
                Send ^#{Left}  ; Swipe Left: Previous Virtual Desktop
        }
        else 
        {
            ; Vertical focus
            if (diffY < 0)
                Send #{Tab}    ; Swipe Up: Task View
            else
                Send #d        ; Swipe Down: Show/Hide Desktop
        }
        return
    }
    else ; Normal Middle Click
    {
        Click, Middle
    }
return

; Emergency toggle: Ctrl + Alt + S to suspend/resume script
^!s::Suspend