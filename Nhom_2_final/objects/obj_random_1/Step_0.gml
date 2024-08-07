/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 00E75A9F
/// @DnDArgument : "code" "if i < 150{$(13_10)i +=1$(13_10)if i mod 5 == 0{$(13_10)	y -= 3$(13_10)	var number = irandom(array_length_1d(outfits) - 1);$(13_10)    sprite_index = outfits[number];$(13_10)}$(13_10)}$(13_10)if i == 150{$(13_10)	if sprite_index == spr_coin$(13_10)		instance_create_layer(x,y,"Instances_up",Obj_coin)$(13_10)	else if sprite_index == spr_hp$(13_10)		instance_create_layer(x,y,"Instances_up",obj_hp)$(13_10)	else if sprite_index == spr_ammo$(13_10)		instance_create_layer(x,y,"Instances_up",obj_ammo)$(13_10)	instance_destroy()$(13_10)}$(13_10)"
if i < 150{
i +=1
if i mod 5 == 0{
	y -= 3
	var number = irandom(array_length_1d(outfits) - 1);
    sprite_index = outfits[number];
}
}
if i == 150{
	if sprite_index == spr_coin
		instance_create_layer(x,y,"Instances_up",Obj_coin)
	else if sprite_index == spr_hp
		instance_create_layer(x,y,"Instances_up",obj_hp)
	else if sprite_index == spr_ammo
		instance_create_layer(x,y,"Instances_up",obj_ammo)
	instance_destroy()
}