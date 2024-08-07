global.hp = 100
global.energy = 100
hspeed = 0
vspeed = 0 
spd = 10
gra = 1
add_energy = 0
minus_energy = 0
i = 0

//shooting func
offsetY = -45
// ground
tile_wall = layer_tilemap_get_id("lay_ts_wall")
gun = instance_create_layer(x,y,"Instances",obj_gun)
sword = instance_create_layer(x,y,"Instances",obj_sword)
//0 : moving, 1: dead
state = 0

// camera
xcam = 0
ycam = 0
xto = 0
yto = 0
cam_w = camera_get_view_width(view_camera[0])
cam_h = camera_get_view_height(view_camera[0])