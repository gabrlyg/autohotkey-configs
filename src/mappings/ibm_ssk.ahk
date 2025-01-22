#Requires AutoHotkey v2.0
#SingleInstance Force

#Include ..\utils.ahk

; Create menu and set check mark
AddKeyboardMenu()
SetMenuCheckMark(MAPPING_SSK)

; This config is to work with Powertoys on Windows
; while still maintaining an HHKB-like layout
;
; the Powertoys config swaps Win and Ctrl basically

; Left side modifiers
LCtrl::LAlt
LAlt::LCtrl
CapsLock::LWin

; Right side modifiers
RAlt::RCtrl
RCtrl::RAlt

SaveLastUsedMapping(MAPPING_SSK)