#Requires AutoHotkey v2.0
#SingleInstance Force

; File to store the last used mapping
global LAST_USED_MAPPING_FILE := "last_mapping.save"
global DEFAULT_MAPPING_FILE := "mappings\default.ahk"
global SSK_MAPPING_FILE := "mappings\ibm_ssk.ahk"
global DGE_MAPPING_FILE := "mappings\otd_356_cl_dge.ahk"

global MAPPING_DEFAULT := "default"
global MAPPING_SSK := "ssk"
global MAPPING_DGE := "dge"

global MENU_DEFAULT := "No Mapping (Default)"
global MENU_SSK := "IBM SSK"
global MENU_DGE := "OTD 356 CL DGE"

global LOG_FILE := "keyboard_manager.log"
global LOG_LEVELS := Map(
    "info", "[INFO]",
    "error", "[ERROR]"
)

global LOG_ENABLED := true

LoadConfig(mapping) {
    try {
        Log("info", "Loading config: " mapping "...")

        ; necessary to avoid keyboard specific scripts using its own directory
        ; as working directory, i.e. looking for "src\mappings\mappings\[keyboard].ahk"
        SetWorkingDir A_InitialWorkingDir

        Log("info", "Initial working dir: " A_InitialWorkingDir)
        Log("info", "Current working directory" A_WorkingDir)
        switch mapping {
            case MAPPING_DEFAULT: Run DEFAULT_MAPPING_FILE
            case MAPPING_SSK: Run SSK_MAPPING_FILE
            case MAPPING_DGE: Run DGE_MAPPING_FILE
        }
        Log("info", "Config loaded: " mapping)

        ; necessary to ensure only the newly-loaded script running
        ExitApp
    } catch Error as err {
        Log("info", "[ERROR] " err.Message)
    }
}

AddKeyboardMenu() {
    A_TrayMenu.Add()    ; Separator from the original menu
    A_TrayMenu.Add(MENU_DEFAULT, (*) => LoadConfig(MAPPING_DEFAULT))
    A_TrayMenu.Add(MENU_SSK, (*) => LoadConfig(MAPPING_SSK))
    A_TrayMenu.Add(MENU_DGE, (*) => LoadConfig(MAPPING_DGE))
}

SetMenuCheckMark(mapping) {
    A_TrayMenu.Uncheck(MENU_DEFAULT)
    A_TrayMenu.Uncheck(MENU_SSK)
    A_TrayMenu.Uncheck(MENU_DGE)

    switch mapping {
        case MAPPING_DEFAULT: A_TrayMenu.Check(MENU_DEFAULT)
        case MAPPING_SSK: A_TrayMenu.Check(MENU_SSK)
        case MAPPING_DGE: A_TrayMenu.Check(MENU_DGE)
    }
}

SaveLastUsedMapping(mapping) {
    try {
        ; necessary to avoid keyboard specific scripts using its own directory
        ; as working directory, i.e. looking for "src\mappings\mappings\[keyboard].ahk"
        SetWorkingDir A_InitialWorkingDir
        if FileExist(LAST_USED_MAPPING_FILE) {
            FileDelete LAST_USED_MAPPING_FILE
        }
        FileAppend mapping, LAST_USED_MAPPING_FILE
    } catch Error as err {
        Log("error", err.Message)
    }
}

Log(level, message) {
    if LOG_ENABLED {
        ; necessary to avoid keyboard specific scripts using its own directory
        ; as working directory, i.e. looking for "src\mappings\mappings\[keyboard].ahk"
        SetWorkingDir A_InitialWorkingDir
        timestamp := FormatTime(A_NowUTC, "dd-MM-yyyy HH:mm:ss")
        FileAppend LOG_LEVELS.Get(level) " " timestamp " - " message "`n", LOG_FILE
    }
}
