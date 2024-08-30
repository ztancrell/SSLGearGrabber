#Requires AutoHotkey v2.0

; Approximate hex colors for Gears in SSL. Will probably change, idk.
; Dark Yellow = 0xd5b94f
; Light Yellow = 0xefe56e
; Green = 0x2b6a19

; Developer :: Zach Tancrell <https://www.github.com/ztancrell>

MsgBox "Press NumpadAdd when you are ingame to enable the SSL Auto Gear script. Enjoy!", "SSL Auto Gear"

HotIfWinActive "ahk_class ShellShock Live"
If KeyWait("NumpadAdd", "D") {
	Loop {
		coinCheck()
	}
}

; Check for the specific pixel colors of the "Gears" in ShellShock Live
; Click when it is found.
; Bug(s): Main menu causes the script to freakout, due to the gear near your profile picture. Might also bug out on the Tab menu ingame.
coinCheck(){
	CoordMode "Pixel", "Screen"

	; Checks for gear coin hex color and moves mouse to it (to obtain it; no click required)
	If PixelSearch(&Px, &Py, 0, 0, 1920, 1080, 0xefe56e, 3)
		; MsgBox "A color within 3 shades of variation was found at X" Px " Y" Py
		MouseMove Px, Py
}

#x::ExitApp  ; Win+X