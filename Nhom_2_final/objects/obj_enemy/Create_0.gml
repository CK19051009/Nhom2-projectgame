//enemy create
// movement
hspeed = 0
vspeed = 0
gra = 1
mask_index = spr_ene1_idle
// wall
tile_wall = layer_tilemap_get_id("lay_ts_wall")

// 0: đứng im || 1: tấn công ||  2: chết
state = 0
// bộ đếm thời gian
step = 0

// play style

find_dis = 600

sprite_idle = spr_ene1_idle
sprite_atk = spr_ene1_atk
sprite_bullet = spr_ene1_bullet