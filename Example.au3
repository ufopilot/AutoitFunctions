#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <Misc.au3>



#include 'Animate.au3'
#include 'DragAndDrop.au3'
#include 'CreateWidget.au3'

HotKeySet("{ESC}", "_Exit")

$GUI = GUICreate("Animate / DragAndDrop GUICTRL", 1000, 500, -1, -1)

GUICtrlCreateGroup("Test", 780, 10, 200, 480)
GUICtrlCreateLabel("Left", 800, 50, 30, 22)
$x = GUICtrlCreateInput("100", 840, 50, 80, 22)
GUICtrlCreateLabel("Top", 800, 80, 30, 22)
$y = GUICtrlCreateInput("100", 840, 80, 80, 22)
GUICtrlCreateLabel("Width", 800, 110, 30, 22)
$w = GUICtrlCreateInput("200", 840, 110, 80, 22)
GUICtrlCreateLabel("Height", 800, 140, 30, 22)
$h = GUICtrlCreateInput("200", 840, 140, 80, 22)

GUICtrlCreateLabel("Speed", 800, 170, 30, 22)
$s = GUICtrlCreateInput("1", 840, 170, 80, 22)
GUICtrlCreateUpdown($s)
GUICtrlSetLimit ( -1, 200, 1)

GUICtrlCreateLabel("Step", 800, 200, 30, 22)
$step = GUICtrlCreateInput("1", 840, 200, 80, 22)
GUICtrlCreateUpdown($step)
GUICtrlSetLimit ( -1, 3, 1)

$radio1 = GUICtrlCreateRadio("Label1", 800, 240, 50, 20)
GUICtrlSetState(-1, $GUI_CHECKED)
$radio2 = GUICtrlCreateRadio("Label2", 800, 270, 50, 50)

$test = GUICtrlCreateButton("Animate", 785, 450, 50, 30)
$reset = GUICtrlCreateButton("Reset", 835, 450, 50, 30)
$widget = GUICtrlCreateButton("Widget", 885, 450, 50, 30)
GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateGroup("Code", 10, 450, 766, 40)
$code = GUICtrlCreateLabel("", 20, 468, 700, 22)
GUICtrlCreateGroup("", -99, -99, 1, 1)


$Label1 = GUICtrlCreateLabel(@CRLF & "  Label1  ", 10, 10, 100, 100)
GUICtrlSetBkColor(-1, 0X0000ff)
GUICtrlSetColor(-1, 0Xffffff)

$Label2 = GUICtrlCreateLabel(@CRLF & "  Label2  ", 300, 10, 100, 100)
GUICtrlSetBkColor(-1, 0xb34d4d)
GUICtrlSetColor(-1, 0Xffffff)

; drag and drop controls
Global $ctrls[2]
$ctrls[0] = $Label1
$ctrls[1] = $Label2

GUISetState(@SW_SHOW, $GUI)
While 1
		$Msg = GUIGetMsg()
		Switch $Msg
			; Drag and drop
			Case $GUI_EVENT_PRIMARYDOWN
				_DragAndDrop($GUI, $ctrls)
            ; Animate
			Case $Test
				iF GUICtrlRead($radio1) = 1 Then
					$label = $Label1
				Else
					$label = $Label2
				EndIf

				 GUICtrlSetData($code, "_Animate(conrolID, GUI-controlID, "&GUICtrlRead($x)&", "&GUICtrlRead($y)&", "&GUICtrlRead($w)&", "&GUICtrlRead($h)&", "&GUICtrlRead($s)&", "&GUICtrlRead($step)&")")

				 $do = _Animate($Label, $GUI, GUICtrlRead($x), GUICtrlRead($y), GUICtrlRead($w), GUICtrlRead($h), GUICtrlRead($s), GUICtrlRead($step))
                 If Not $do Then
					 MsgBox(1, "Error", "Check your parameters")
				 EndIf
			; Reset Animation
			Case $Reset
				iF GUICtrlRead($radio1) = 1 Then
					_Animate($Label1, $GUI, 10, 10, 100, 100, GUICtrlRead($s), GUICtrlRead($step))
				Else
					_Animate($Label2, $GUI, 300, 10, 100, 100, GUICtrlRead($s), GUICtrlRead($step))
				EndIf
			Case $widget
                 $newwidget = _DrawWidget($GUI, "New Widget", GUICtrlRead($x), GUICtrlRead($y), GUICtrlRead($w), GUICtrlRead($h))
				  ;WinMove($newwidget, '', 10,10)

            ; Exit
			Case $GUI_EVENT_CLOSE
                ExitLoop
		EndSwitch

WEnd



Func _Exit()
	Exit
EndFunc