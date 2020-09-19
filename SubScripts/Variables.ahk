; get env var value from windows native env var, because there're a couple that's not included in the AHK env vars.
EnvGet, HOME, UserProfile ; HOME is the new var name, UserProfile is the native windows env var which points to ~ .
; This file uses "expression mode" for strings. A dot means concat. Read cheat sheet autoHotkeys for details
APPDATA := HOME . "\AppData"
DirDropbox := HOME . "\Dropbox"
DirPortables := DirDropbox . "\Portables"
DirYoutubeDownloads := HOME . "\Desktop\youtube-dl one time download"
DirDownloads := HOME . "\Downloads"
PathToSublime := "C:\Sudo\Sublime Text 3\sublime_text.exe"
PathToVSCode := APPDATA . "\Local\Programs\Microsoft VS Code\Code.exe"
PathToVSCodeInsiders := "C:\Program Files\Microsoft VS Code Insiders\Code - Insiders.exe"
PathToSpotify := APPDATA . "\Roaming\Spotify\Spotify.exe"
PathToSlack := APPDATA . "\Local\slack\slack.exe"
PathToChrome := "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
PathToEvernote := "C:\Program Files (x86)\Evernote\Evernote.exe"
PathToFoobar2000 := HOME . "\apps\foobar2000\foobar2000.exe"

; the following portable apps need to be installed in different paths on different computers so that the dropbox syncing doesn't interfere with each other
; A_xxx is env var of AHK
; assigning variable using "traditional mode" (= instead of :=), read cheat sheet autoHotkeys to understand the syntax
PathToAnki := A_ProgramFiles . "\Anki\Anki.exe"
PathToConEmu := DirPortables . "\" . A_ComputerName . "\ConEmu\ConEmu64.exe"



Sql := false ; This is a global variable for writing SQL queries, see SQL.ahk
