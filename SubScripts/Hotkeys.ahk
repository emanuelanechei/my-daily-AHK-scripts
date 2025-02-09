/*
Purpose:
  Use F3 to cycle through Explorer widnows on the Win-3 stack
Syntax:
  hotkey::function call.
  Key combination is allowed which is different from a remap.
  ^ = Ctrl, ! = Alt, + = Shift, # = Win.
  Send is a built-in function. Curly braces means a key. Without curly braces it'll be sent as string input.
*/

F3::Send ^#{3} ; #{3} is win-3, ^#{3} is ctr-win-3, which goes to the previous

/*
Purpose:
  Alt + , => right arrow once then comma then space.
  Alt + ; => right arrow once then colon then space.
  Alt + . => right arrow once then period.
  These are often useful in JS and JSON.
*/
!,::Send {right},{space}
!;::Send {right}:{space}
!.::Send {right}.

/*
Purpose:
  Win + CapsLock => CapsLock
  Since CapsLock is remapped to Ctrl, there needs to be a way to press it.
*/
#CapsLock::CapsLock

/*
Purpose:
  LCtrl + enter => new line below
  LCtrl + shift + enter => new line above
Why do this:
  To mimic the Sublime Text behavior in other apps, but with LCtrl only, because RCtrl + Enter in other apps needs to be reserved for their own settings.
Syntax:
  In the following case, <^ means LCtrl, >^ means RCtrl.
*/
<^'::Send {End}{Enter} ; Remember, Enter is already remapped to '
<^+'::Send {Home}{Enter}{Up}

/*
Purpose:
  ` + Esc => Mute.
  ` + 1 => Volume down.
  ` + 2 => Volume up.
Syntax:
  Same as above, but defines ` as a new modifier key.
*/
` & Esc::Send {Volume_Mute}
` & 1::Send {Volume_Down}
` & 2::Send {Volume_Up}

/*
Purpose:
  ` + left / right to move between tabs
  ` + left => Ctrl + PgUp
  ` + right=> Ctrl + PgDn
Syntax:
  Sometimes if there's mysterious bugs, add return in the end helps.
*/
` & Left::
` & [::
  Send ^{PgUp}
return
` & Right::
` & \::
  Send ^{PgDn}
return

/*
Purpose:
  Restore the original function of ` key
Explain:
  Since ` has become a modifier key, it no longer works when pressed, because the script is always waiting for the potential second key.
*/
`::` ; Remap ` to itself, the script will know you want a restore, but it only fires on key up.

/*
Purpose:
  Use ; as a modifier to type symbols
Syntax:
  1. Unless appears right after another character, ; needs ` as an escape char.
  2. The Send {keyname} was the traditional syntax, and the bare key name is the new syntax introduced after 2018 version. However, I found it creates a bug where j; / l; / d; etc doesn't output the semicolon if you press too fast. So the old syntax is more reliable.
  3. Also, when using MS PinYin, symbols like ? and ! will trigger the shift key and switch the input to English, the old method doesn't have this issue.
*/

`; & q::^
`; & w::Send `%
`; & e::&
`; & r::*
`; & a::{
`; & s::}
`; & u::[
`; & o::]
`; & j::Send {(}
`; & l::Send {)}
`; & d::Send {=}
`; & f::Send {NumpadSub}
`; & i::Send {"}
`; & k::Send {'}
`; & z::_
`; & x::Send {+}
`; & g::Send {?}
`; & c::/
`; & v::\
`; & `::~
`; & 1::Send {!}
`; & 2::@
`; & 3::#
`; & 4::$
`; & t::Send {|}

/*
Purpose:
  Restore semicolon after it has become a modifier key
  Restore it by giving it specific instructions:
    ; => ; at line end
    LCtrl + ; => ;
    RCtrl + ; => ; at line end and enter
      (this is commented out now, because I rarely use it)
*/

/*
$;::
if GetKeyState("CapsLock","p")
  Send {end};{Enter}
else
  Send {end}{;}
Return
;since my RCtrl is a remapped key, >^ doesn't really work, so I have to use this ugly way. "p" means retrive the phisical state of the key
*/

`;::; ; Restore ; in the normal way, after the block below was disabled (haven't been very useful, while causing other inconveniences).
/*

$;::Send {end}{;} ; `$` means prevent the hotkey to trigger itself;
^;::Send {;}
+;::Send {:} ;Because ; was restored by a hotkey as opposed to a remap, any modifier key with ; needs to be separately restored, which is different from restoring the ` using a remap, which doesn't need to explicitly restore "~"
 */

/*
Purpose:
  2 + Home => backspace to line beginning
  2 + End => delete to line end
  2 + ← => same as 2 + Home
  2 + → => same as 2 + End
  2 + ↑ => delete line and move to previous line end
  2 + ↓ => delete line and move next line up (same as Ctrl-Shift-K in Sublime Text)
Syntax:
  Since = [ ] \ were remapped, it wouldn't work, so remap them separately.
  If more than one hotkey combinations are mapped to the same functions, stack them on the left side of ::
*/
2 & Home::
  2 & Enter::Send +{Home}{Delete}
2 & End::
  2 & RShift::Send +{End}{BackSpace}

2 & Left::
  2 & [::Send +{Home}{Delete}
2 & Right::
  2 & \::Send +{End}{BackSpace}

2 & Up::
  2 & =::Send {End}+{Home}+{Home}{Delete}{BackSpace} ; shift home twice to clear indentations
2 & Down::
  2 & ]::Send {space}{End}+{Home}+{Home}{Delete}{Delete} ; shift home twice to clear indentations
  2::2

  /*
  Purpose:
    ` + space: pause and play foobar2000
    Ctrl+Alt+Shift+5 is set to be the global hotkey for this function in foobar2000, but I need a easier version in actuality
  */

  ` & space::Send ^!+5

  /*
  Purpose:
    Restart the Script. Sometimes some modifier keys get stuck, restarting may help.
    The following scripts were copied exactly from the doc.
  */
^!F12::
  Reload
  Sleep 1000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
  MsgBox, 4,, The script could not be reloaded. Would you like to open it for editing?
  IfMsgBox, Yes, Edit
    return

  /*
  Purpose:
    Sometimes some modifier keys get stuck, this will try to release all of them.
  */
^!F11::
  Send {RShift up}
  Send {LShift up}
  Send {RCtrl up}
  Send {LCtrl up}
  Send {RAlt up}
  Send {LAlt up}
  Send {CapsLock up}
  Send {` up}
  Send {; up}
  Send {1 up}
  Send {2 up}
  Send {3 up}
  Send {4 up}
  Send {Numpad0 up}
return

/*
Purpose:
  Simulate ctrl+ and ctrl- to zoom in and out. Since + and - have been remapped, I need to find a way to simulate them.
*/
^0::Send ^{=}
^9::Send ^{-}

/*
A demo of how to use clicpboard.
To try, go to voidtools everything and find a mp3, then right click to copy full path. Then fire the hotkey.
To understand it, first read cheat sheet autohotkeys, then read doc about `clicboard`, then read doc about `run`
*/

#F12::Run, %PathToFoobar2000% "%clipboard%"

/*
用Ctrl J Ctrl O 来切换输入法
本来我是用Win中设快捷键: Time & Language > Typing > Advanced keyboard settings > Input language hot keys. 我设为了Ctrl-Shift-7和Ctrl-Shift-8
后来发现win10有bug, EN总是被重设位none, 所以我就换成了function call
 */
; ^j::Send ^+{7}
; ^o::Send ^+{8}
^o::
  zh := DllCall("LoadKeyboardLayout", "Str", "00000804", "Int", 1)
  PostMessage 0x50, 0, %zh%,, A
Return
^j::
  en := DllCall("LoadKeyboardLayout", "Str", "00000409", "Int", 1)
  PostMessage 0x50, 0, %en%,, A
Return
