if global.kick == 1 and count ==0 and global.key_1 >= 1 {
	sprite_index = spr_KhoBau_1_Open
	count+=1
	instance_create_layer(x-20,y-10,"Instances_up",obj_random_1)
	global.key_1 -= 1
	alarm[0] = 30
}