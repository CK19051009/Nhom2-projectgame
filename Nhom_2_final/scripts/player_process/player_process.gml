function input(){
	_left = keyboard_check(ord("A"))
	 _right = keyboard_check(ord("D"))
	_up = keyboard_check(ord("W"))
	_space = keyboard_check_pressed(vk_space)
	_down = keyboard_check(ord("S"))
}
function plus_energy(){
	if global.energy == 100 add_energy = 0
	else	add_energy += 1
	if add_energy mod 5 == 0	global.energy += 1
}

function lost_energy(){
	if global.energy <= 0 minus_energy = 0
	else	minus_energy -= 1
	if minus_energy mod 3 == 0	global.energy -= 1
}
function player_movex (){
	input()
	var count_attack = 0 
	hspeed = _right - _left
	if global.energy > 5 hspeed *= spd 
	else hspeed = 0
	
	if place_meeting(x+hspeed,y,tile_wall){
		while(not place_meeting(x+sign(hspeed),y,tile_wall)){
			x += sign(hspeed)	
		}
		hspeed = 0
	}
	
	//animation
	if hspeed ==0 {
		sprite_index = spr_player_idle	
		if global.energy < 100 plus_energy()
	}
	else{
		lost_energy()
		sprite_index = spr_player_run	
	}
	
	//left right animate
	if hspeed > 0 image_xscale = 1
	if hspeed < 0 image_xscale = -1
}


function player_movey(){
	input()
	
	gra = 1
	if _up and vspeed > 0 gra = 0.06
	
	vspeed += gra
	
	//jump function
	if place_meeting(x,y+1,tile_wall){
		if _up and global.energy > 20{
			vspeed = -25
			global.energy -=15}
		gun.image_alpha = 1
	}else{
		gun.image_alpha = 0	
	}
	
	
	//collision handle
	if place_meeting(x,y+vspeed,tile_wall){
		while(not place_meeting(x,y+sign(vspeed),tile_wall)){
			y+= sign(vspeed)	
		}
		vspeed = 0
		if _down sprite_index = spr_player_kick
	}
	else{
		if vspeed < 0 sprite_index = spr_player_jump
		else if _up sprite_index = spr_player_jump
	}
}
function sword_handle(){
	
	sword.x = x 
	sword.y = y - 35
	sword.image_xscale = image_xscale
	sword.depth = -1
	if sword.image_alpha != 0 and _space{
		sword.image_speed = 4
		sword.count = 0
	}
	
}
function gun_handle(){
	gun.x = x
	gun.y = y + offsetY
	gun.image_xscale = image_xscale
	gun.depth = -1
	if gun.image_alpha != 0 and _space and global.bullet >= 1{
		var _bullet = instance_create_layer(gun.x + 20 + image_xscale*30,gun.y+5,"Instances",obj_bullet)
		global.bullet -= 1
		with(_bullet){
			speed = 30
			depth = -2
			image_xscale = other.image_xscale
			if other.image_xscale = 1 direction = 0
			else  direction = 180
		}
	}
}

function player_camera(){
	xto = obj_player.x - cam_w/2
	yto = obj_player.y - cam_h/2
	
	xcam += (xto - xcam) / 25
	ycam += (yto - ycam) / 25
	
	xcam = clamp(xcam,0,room_width-cam_w)
	ycam = clamp(ycam,0,room_height-cam_h)
	
	camera_set_view_pos(view_camera[0],xcam,ycam)

}

function player_die(){
	if global.lives > 1{
		sprite_index = spr_player_dead
		if sprite_index >= sprite_get_number(spr_player_dead) - 1 {
			instance_destroy()
			instance_create_layer(192,384,"Instances",obj_player)
			global.lives -= 1
		}
	}
	else game_end()
}