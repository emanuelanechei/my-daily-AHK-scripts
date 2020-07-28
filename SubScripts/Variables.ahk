; Variables are declared when first used.
; := means assignment

PathToDesktop := "C:\Users\Zhi\Desktop"
PathToYoutubeDownloads := "C:\Users\Zhi\Desktop\youtube-dl one time download"
PathToDownloads := "C:\Users\Zhi\Downloads"
PathToSublime := "C:\Sudo\Sublime Text 3\sublime_text.exe"
PathToVSCode := "C:\Users\Zhi\AppData\Local\Programs\Microsoft VS Code\Code.exe"
PathToVSCodeInsiders := "C:\Program Files\Microsoft VS Code Insiders\Code - Insiders.exe"
PathToConEmu := "C:\Dropbox\Portables\ConEmu Portable - PreviewVersion171109\ConEmu64.exe"
PathToSpotify := "C:\Users\Zhi\AppData\Roaming\Spotify\Spotify.exe"
PathToSlack := "C:\Users\Zhi\AppData\Local\slack\slack.exe"
PathToVivaldi := "C:\sudo\Vivaldi\Application\vivaldi.exe"
PathToChrome := "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
PathToFirefox := "C:\Program Files\Mozilla Firefox\firefox.exe"
PathToBrave := "C:\Program Files (x86)\BraveSoftware\Brave-Browser\Application\brave.exe"
PathToEvernote := "C:\Program Files (x86)\Evernote\Evernote.exe"
; I have more than one computers, and sometimes apps are installed in different paths:
if (A_ComputerName = "ZHI-DESKTOP") { ; single equal sign means evaluation
  PathToAnki := "C:\sudo\Anki\anki.bat"
  PathToConEmu := "C:\Dropbox\Portables\ConEmu Portable - PreviewVersion171109\ConEmu64.exe"
  PathToFoobar2000 := "C:\sudo\foobar2000\foobar2000.exe"
} else if (A_ComputerName = "ZHI-MI") { ; A_ComputerName is sort of an environmental variable
  PathToAnki := "C:\Program Files\Anki\anki.exe"
  PathToConEmu := "C:\Dropbox\Portables\MI\ConEmuPack.200615\ConEmu64.exe"
  PathToFoobar2000 := "C:\Dropbox\Portables\MI\foobar2000\foobar2000.exe"
}

Sql := false ; This is a global variable for writing SQL queries, see SQL.ahk
