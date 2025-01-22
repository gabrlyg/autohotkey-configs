#Requires AutoHotkey v2.0
#SingleInstance Force

#Include ../utils.ahk

; Create menu and set check mark
AddKeyboardMenu()
SetMenuCheckMark(MAPPING_DEFAULT)

; based on experimentations, key-mappings are
; required, otherwise the script will execute
; then quit, as if nothing happened.
LAlt::LAlt
LCtrl::LCtrl
CapsLock::CapsLock

RAlt::RAlt
RCtrl::RCtrl

SaveLastUsedMapping(MAPPING_DEFAULT)