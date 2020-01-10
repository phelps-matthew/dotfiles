#CapsLock::Send {LControl Down}
#CapsLock Up::Send {LControl Up}
$CapsLock::Ctrl
;LCtrl::Send {Escape}
!h::Send #{left}
!j::Send #{down}
!k::Send #{up}
!l::Send #{right}

!o::alttabandmenu

#if winactive("ahk_class TaskSwitcherWnd")
; '*' prefix causes unhandled exception here, do not use
!f1::
	send {blind}{tab}
	keywait f1, t.5
return

; either - swap/exit menu on release
!f1 up::send {alt up}

; or - swap/exit menu on command
 *space::send {alt up}	; select item
 *esc::send !{esc}{alt up}	; cancel menu
return
