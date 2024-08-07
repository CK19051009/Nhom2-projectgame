/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 00E75A9F
/// @DnDArgument : "code" "if i < 150{$(13_10)i +=1$(13_10)if i mod 5 == 0{$(13_10)	y -= 3$(13_10)	var number = irandom(array_length_1d(outfits) - 1);$(13_10)    sprite_index = outfits[number];$(13_10)}$(13_10)}$(13_10)if i == 150{$(13_10)	if sprite_index == spr_gold$(13_10)		instance_create_layer(x,y,"Instances_up",obj_gold)$(13_10)	else if sprite_index == spr_life$(13_10)		instance_create_layer(x,y,"Instances_up",Obj_life)$(13_10)	instance_destroy()$(13_10)}$(13_10)"
if i < 150{
i +=1
if i mod 5 == 0{
	y -= 3
	var number = irandom(array_length_1d(outfits) - 1);
    sprite_index = outfits[number];
}
}
if i == 150{
	if sprite_index == spr_gold
		instance_create_layer(x,y,"Instances_up",obj_gold)
	else if sprite_index == spr_life
		instance_create_layer(x,y,"Instances_up",Obj_life)
	instance_destroy()
}