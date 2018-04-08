#include <Array.au3>
;*************************************************************************
;* _Animate(ControlID, GUI-ID="", x=False, y=False, w=False, h=False)
;-------------------------------------------------------------------------
;* ControID: 	(Label / Group / ListView/ pic/ ....)
;* GUI-ID: 		Parent Gui  (default Empty)
;* x: 			Left Position (default Empty.. Will be not changed)
;* y: 			Top Position (default Empty.. Will be not changed)
;* w: 			Width  (default Empty.. Will be not changed)
;* h: 			Height  (default Empty.. Will be not changed)
;* speed:		1 .. 100
;*************************************************************************
;*************************************************************************

Func _Animate($hCtrl, $hGui = "",  $x=False, $y=False, $w=False, $h=False, $speed=1, $step=1)
	$aPos = ControlGetPos($hGui, "", $hCtrl)
	If $x And Not StringIsInt($x) Then Return
	If $y And Not StringIsInt($y) Then Return
	If $w And Not StringIsInt($w) Then Return
	If $h And Not StringIsInt($h) Then Return
	If $speed And Not StringIsInt($speed) Then Return
	If $step  < 1  OR  $step > 3 Then Return False
	; Left
	$maxx = $aPos[0]
	If $x  And StringIsInt($x) And $x <> $aPos[0] Then
		If $x > $aPos[0] Then
			$maxx = $x - $aPos[0]
			$oprx = "+"
		Else
			$maxx = $aPos[0] - $x
			$oprx = "-"
		EndIf
	EndIf
    ; Top
	$maxy = $aPos[1]
    If $y  And StringIsInt($y) And $y <> $aPos[1] Then
		If $y > $aPos[1] Then
			$maxy = $y - $aPos[1]
			$opry = "+"
		Else
			$maxy = $aPos[1] - $y
			$opry= "-"
		EndIf
	EndIf
	; Width
	$maxw = $aPos[2]
	If $w  And StringIsInt($w) And $w <> $aPos[2] Then
		If $w > $aPos[2] Then
			$maxw = $w - $aPos[2]
			$oprw = "+"
		Else
			$maxw = $aPos[2] - $w
			$oprw = "-"
		EndIf
	EndIf
	; Height
	$maxh = $aPos[3]
	If $h  And StringIsInt($h) And $h <> $aPos[3] Then
		If $h > $aPos[3] Then
			$maxh = $h - $aPos[3]
			$oprh = "+"
		Else
			$maxh = $aPos[3] - $h
			$oprh = "-"
		EndIf
	EndIf

    Dim $Array[4]
    $Array[0] = $maxx
    $Array[1] = $maxy
    $Array[2] = $maxw
    $Array[3] = $maxh

	$valX = $aPos[0]
	$valY = $aPos[1]
	$valW = $aPos[2]
	$valH = $aPos[3]

	For $i = 1 To _ArrayMax($Array) Step $step
			Sleep($speed)
			If $x Then
				If $x > $aPos[0] Then
					If $valX >= $x Then
						$valX = $x
					Else
						$valX = Execute($aPos[0] & $oprx & $i)
					EndIf
				Else
					If $valX <= $x Then
						$valX = $valX
					Else
						$valX = Execute($aPos[0] & $oprx & $i)
					EndIf
				EndIf
			EndIf
            If $y Then
				If $y > $aPos[1] Then
					If $valY >= $y Then
						$valY = $y
					Else
						$valY = Execute($aPos[1] & $opry & $i)
					EndIf
				Else
					If $valY <= $y Then
						$valY = $valY
					Else
						$valY = Execute($aPos[1] & $opry & $i)
					EndIf
				EndIf
            EndIf
			If $w Then
				If $w > $aPos[2] Then
					If $valW >= $w Then
						$valW = $w
					Else
						$valW = Execute($aPos[2] & $oprw & $i)
					EndIf
				Else
					If $valW <= $w Then
						$valW = $valW
					Else
						$valW = Execute($aPos[2] & $oprw & $i)
					EndIf
				EndIf
			EndIf
			If $h Then
				If $h > $aPos[3] Then
					If $valh >= $h Then
						$valH = $h
					Else
						$valH = Execute($aPos[3] & $oprh & $i)
					EndIf
				Else
					If $valH <= $h Then
						$valH = $valH
					Else
						$valH = Execute($aPos[3] & $oprh & $i)
					EndIf
				EndIf
			EndIf
			GUICtrlSetPos ($hCtrl, $valX, $valY, $valW, $valH)
	Next
	Return True
EndFunc