/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 2BB649D1
/// @DnDArgument : "code" "_e = keyboard_check_pressed(ord("E"))$(13_10)if _e{$(13_10)	instance_destroy()$(13_10)	global.weapon_sword = 1$(13_10)}"
_e = keyboard_check_pressed(ord("E"))
if _e{
	instance_destroy()
	global.weapon_sword = 1
}