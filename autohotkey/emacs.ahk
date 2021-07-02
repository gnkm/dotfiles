#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

delete_backward_char()
{
  Send {BS}
  Return
}

quit()
{
    Send {ESC}
    Return
}

newline()
{
    Send {Enter}
    Return
}

; 無効にするアプリケーションを指定する
is_target()
{
    ; IfWinActive,ahk_exe Code.exe ; VSCode
    ;     Return false

    Return false
}

^g::
    If is_target()
        Send %A_ThisHotkey%
    Else
        quit()
    Return

^m::
    If is_target()
        Send %A_ThisHotkey%
    Else
        newline()
    Return
