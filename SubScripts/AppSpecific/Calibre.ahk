#IfWinActive ahk_exe calibre-parallel.exe

Space::
  if (abstinence > 0 And !locked) {
    Send {Space}
    abstinence --
  }
  if (abstinence > 0 And locked) {
    ; MsgBox Current abstinence: %abstinence%
  }
  if (abstinence = 0) {
    locked = True
  }
  return

PgDn::
  MsgBox %abstinence%
  return

#IfWinActive
