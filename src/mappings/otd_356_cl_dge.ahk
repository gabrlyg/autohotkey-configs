#Requires AutoHotkey v2.0
#SingleInstance Force

#Include ../utils.ahk

; Create menu and set check mark
AddKeyboardMenu()
SetMenuCheckMark(MAPPING_DGE)

; The DGE has the following built-in mapping
; LCtrl -> LWin
; LAlt -> LAlt
; CapsLock -> RCtrl

; RAlt -> RAlt
; RCtrl -> RCtrl

; ScrollLock -> CapsLock

LAlt::LWin
LWin::LAlt

RAlt::RWin
RCtrl::RAlt

SaveLastUsedMapping(MAPPING_DGE)