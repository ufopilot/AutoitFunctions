#include <GUIConstantsEx.au3>
#include <guiconstants.au3>
Func _DragAndDrop($hGui, $ctrls)
	While _IsPressed(01)
	    $MouseHoverControl = GUIGetCursorInfo($hGui)

        For $i = 0 To UBound($ctrls) -1
	        If $MouseHoverControl[4] = $ctrls[$i] Then
	        		GUICtrlSetPos($ctrls[$i], $MouseHoverControl[0]-45, $MouseHoverControl[1]-30)
		    EndIf
		Next
	WEnd
EndFunc

