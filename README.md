# AutoHotkey Scripts

As you know, a nerd with fossil keyboards will need some key mapping.

## Project structure

```txt
autohotkey-configs/
├── .gitignore
├── src/
│   ├── main.ahk
│   ├── utils.ahk
│   ├── mappings/
│   │   ├── default.ahk
│   │   ├── ibm_ssk.ahk
│   │   └── otd_356_cl_dge.ahk
```

- `main.ahk`: entry point
- `utils.ahk`: utility functions
- `mappings\`: folder to store key mapping scripts

## Logic explained

Idk why this section is needed, maybe for my own sanity.

1. `main.ahk` tries to load the last saved mapping, if available, otherwise load default
2. Specific key mapping script will be run, and the original instance started from `main.ahk` will be exited
3. Working directory will have to be set to the initial directory (of `utils.ahk` I believe), so that subsequent scripts running will be able to load files correctly using relative paths.
4. Logs and savings will then effectively be managed by the newly loaded script's instance.
