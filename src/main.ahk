#Requires AutoHotkey v2.0
#SingleInstance Force

#Include .\utils.ahk

; Load Last used mapping on start-up
try {
    if (LOG_ENABLED and FileExist(LOG_FILE)) {
        FileDelete LOG_FILE
    }
    Log("info", "Reading last used mapping...")
    lastUsedMapping := FileRead(LAST_USED_MAPPING_FILE)
    Log("info", "Last used mapping loaded: " lastUsedMapping)

    LoadConfig(lastUsedMapping)
} catch {
    Log("error", "No last used mapping found, will load default")
    LoadConfig(MAPPING_DEFAULT)
}
