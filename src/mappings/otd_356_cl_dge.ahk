#Requires AutoHotkey v2.0
#SingleInstance Force

#Include ../utils.ahk

; Create menu and set check mark
AddKeyboardMenu()
SetMenuCheckMark(MAPPING_DGE)

LAlt::LAlt
LCtrl::LCtrl
CapsLock::CapsLock

RAlt::RAlt
RCtrl::RCtrl

SaveLastUsedMapping(MAPPING_DGE)