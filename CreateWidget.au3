#include <GUIConstantsEx.au3>
#include <guiconstants.au3>

Global $COLOR_MAIN = 0x333333;0x494E48
Global $COLOR_LEFT_PANEL = 0x464646
Global $COLOR_TITLE_BAR = 0x666666;0x5A6A50
Global $COLOR_TITLE_BAR_TEXT = 0xD8DED3
Global $COLOR_BORDER = 0x696A65
Global $COLOR_HEDEAR_TEXT = 0xC3B54C
Global $COLOR_TEXT = 0xffffff

Func _DrawHeader($hBorder, $hGUI)
	$aPos = ControlGetPos($hGUI, "", $hBorder)
	$hHeader = GUICtrlCreateGraphic($aPos[0], $aPos[1], $aPos[2], 20)
    GUICtrlSetState($hHeader, $GUI_DISABLE)
	GUICtrlSetColor($hHeader, $COLOR_BORDER)
	GUICtrlSetBkColor($hHeader, $COLOR_LEFT_PANEL)
    GUICtrlSetResizing($hHeader, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKHEIGHT )
	return $hHeader
EndFunc

Func _DrawHeaderText($eText, $hHeader, $hGUI)
	$aPos = ControlGetPos($hGUI, "", $hHeader)
    $Text = GUICtrlCreateLabel($eText, $aPos[0]+5, $aPos[1] +3, $aPos[2], $aPos[3])
    GUICtrlSetColor($Text, $COLOR_HEDEAR_TEXT)
	GUICtrlSetBkColor($Text, $GUI_BKCOLOR_TRANSPARENT)
    ;GUICtrlSetResizing($Text, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKHEIGHT + $GUI_DOCKWIDTH)
EndFunc


Func _DrawWidget($hGUI, $eText, $eLeft, $eTop, $eWidth, $eHeight)
	$thisChild = GUICreate("", $eWidth, $eHeight, $eLeft, $eTop, $WS_POPUP, BitOR($WS_EX_TRANSPARENT,$WS_EX_MDICHILD), $hGUI)
	$hBorder = GUICtrlCreateGraphic(0, 0, $eWidth, $eHeight)
	GUICtrlSetColor($hBorder, $COLOR_BORDER)
	GUICtrlSetState($hBorder, $GUI_DISABLE)
	;GUICtrlSetResizing($hBorder, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKHEIGHT )
	If $eText <> "" Then
		$hHeader = _DrawHeader($hBorder, $thisChild)
		$hHeaderText = _DrawHeaderText($eText, $hHeader, $thisChild)
	EndIf
	GUISetState(@SW_SHOW, $thisChild)
	Return $thisChild
EndFunc