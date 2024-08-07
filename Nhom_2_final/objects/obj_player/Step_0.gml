player_camera()
player_movex()
player_movey()		

if y > room_height 
	player_die()
if global.hp <= 0{
	sprite_index = spr_player_dead
	i+=1
	if i >= 20
		player_die()}
if global.weapon == "gun" and global.weapon_gun == 1
	gun_handle()
else 
	gun.image_alpha = 0
if global.weapon = "sword" and global.weapon_sword == 1
	sword_handle()
else 
	sword.image_alpha = 0
	
if sprite_index == spr_player_kick
	global.kick = 1
else 
	global.kick = 0
if global.energy <=5 
	spd = 0
else if global.energy <= 10
	spd = 2
else if global.energy <=25
	spd = 5
else if global.energy <=50
	spd = 7
else spd = 10