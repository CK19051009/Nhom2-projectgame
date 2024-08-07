// obj_enemy step



switch state {

	case 0: 
		// dieu chinh sprite
		sprite_index = sprite_idle//sprite_index = spr_ene1_idle
		hspeed = 0
		
		// dieu kien chuyen sang trang thai 1
		if distance_to_object(obj_player) <= find_dis{
			image_index = 0 // 	đưa về khung hình hình ảnh 0, nhằm bắt đầu hình ảnh tiếp theo sẽ bắt đầu lại thao tác tấn công // có thể bỏ thử đoạn code này
			state = 1
		}
		
		// take bullet
		take_bullet()
	break
	
	case 1:
		// dieu chinh sprite
		sprite_index = sprite_atk//sprite_index = spr_ene1_atk 
		
		// huong toi nguoi choi
		var _dir = point_direction(x,y,obj_player.x, obj_player.y)
		// xoay huong ve nguoi choi
		if _dir >=90 and _dir <= 270 {
			image_xscale = -1	
			hspeed = -2
		}
		else{
			image_xscale = 1	
			hspeed = 2
		}
		
		// tại khung hình cuối cùng, tạo đạn và bắn ngay lập tức
		
		if image_index >= sprite_get_number(sprite_index) - 1 {
			// Tạo đạn và lưu vào biến _bullet
			var _bullet = instance_create_layer(x,y,"Instances",obj_enebullet)
			// lập trình với từ khóa with, như là lập trình trong sự kiện create của obj_enebullet
			with _bullet{
				sprite_index = other.sprite_bullet
				speed = 20
				direction = point_direction(x,y,obj_player.x,obj_player.y)
				image_angle = direction
			}
			state = 0
		}
		
		// take bullet
		take_bullet()
	break
	
	case 2:
		sprite_index = spr_enemy_dead // đổi sprite
		// cho kẻ địch ngừng di chuyển
		hspeed = 0
		vspeed = 0
		
		// bắt đầu bộ đếm thời gian
		step = step + 1
		// sau 120 step (2 giây) thì hủy hoàn toàn)
		if step == 120{
			instance_destroy()	
		}
		
	break
}

movement()

/*
// kiểm tra có trúng đạn hay không
if place_meeting(x,y,obj_bullet){
	step = 0
	state = 4
}

switch (state){
	// 0: đứng im
	case 0:
		sprite_index = spr_ene1_idle

		// khoảng cách đến người chơi có bé hơn 500 không?
		if distance_to_object(obj_player) <= 500 {
			step = 0
			state = 2	
		}
		else{
			// nếu khoảng cách lớn hơn 500 thì tang thời gian, 
			//nếu 120 khung hình thì sẽ qua trạng thái lang thang
			step ++
			if step == 120{
				hspeed = choose(5,-5)
				step = 0
				state = 1
			}
		}
		
	break
	
	// 1: Lang thang
	case 1:
		if distance_to_object(obj_player) <= 500 {
			step = 0
			state = 2	
		}
		else{
			// nếu khoảng cách lớn hơn 500 thì tang thời gian, 
			//nếu 120 khung hình thì sẽ qua trạng thái lang thang
			step ++
			if step == 120{
				hspeed = 0
				step = 0
				state = 0
			}
		}
		
		// animation
		sprite_index = spr_ene1_walk
		
		// quay trai phai
		if hspeed > 0 image_xscale = 1
		if hspeed < 0 image_xscale = -1
	break
	
	// 2: truy đuổi
	case 2:
		// tìm hướng đến người chơi
		var _dir = point_direction(x,y,obj_player.x,obj_player.y)
		
		// nếu 90> dir > 270 thì hướng sang trái, không thì hướng sang phải
		if _dir > 90 and _dir < 270 {
			hspeed = -20	
		}
		else{
			hspeed = 20	
		}
		
		// nếu khoảng cách bé hơn 200 thì sang trạng thái tấn công
		if distance_to_object(obj_player) <= 200 {
			// trước khi sang trạng thái tấn công, đặt khung hình hiện tại là 0
			image_index = 0
			state = 3	
		}
		
		// sau 3 giây truy đuổi tự động về trạng thái đứng yên
		step = step + 1
		if step == 180 {
			step = 0
			state = 0
		}
		
		// animation
		sprite_index = spr_ene1_walk
		
		// quay trai phai
		if hspeed > 0 image_xscale = 1
		if hspeed < 0 image_xscale = -1
	break
	
	// 3: tấn công
	case 3:
		sprite_index = spr_ene1_atk
		hspeed = 0
		// Khi hình ảnh sprite là hình cuối thì bắn ra viên đạn hướng tới người chơi, 
		// sau đó về lại trạng thái đứng yên (0)
		if image_index == sprite_get_number(sprite_index) - 1 {
			
			// tạo đạn và lập trình sự kiện create của đạn qua từ khóa with
			var _bul = instance_create_layer(x,y,"Instances",obj_enebullet)	
			with (_bul){
				sprite_index = spr_ene1_bullet
				speed = 30
				direction = point_direction(x,y,obj_player.x,obj_player.y)
			}
			state = 0
		}
	
	break
	
	// 4: chết
	case 4:
		sprite_index = spr_enemy_dead
		hspeed = 0
		vspeed = 0
		step = step + 1
		var _bullet = instance_place(x,y,obj_bullet)
		instance_destroy(_bullet)	//xóa đạn
		if step == 120 {
			instance_destroy()		// xóa kẻ thù
		}
	break
}


