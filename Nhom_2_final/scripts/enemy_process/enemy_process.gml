
function take_bullet(){
	if place_meeting(x,y,obj_bullet){ // nếu đang trúng đạn
	var _bullet = instance_place(x,y,obj_bullet) // tìm viên đạn đó
	instance_destroy(_bullet) // xóa đạn đó đi
	
	state = 2 // chuyển trạng thái của enemy sang bị tiêu diệt
	}
}

function movement() {
	//áp dung trọng lực theo chiều dọc
	vspeed = vspeed + gra

	// xử lý va chạm chiều ngang
	if place_meeting(x+hspeed,y,tile_wall){
		while(not place_meeting(x+sign(hspeed),y,tile_wall)){
			x+=sign(hspeed)
		}
		hspeed = 0
	}

	// xử lý va chạm chiều dọc
	if place_meeting(x,y+vspeed,tile_wall){
		while(not place_meeting(x,y+sign(vspeed),tile_wall)){
			y+=sign(vspeed)
		}
		vspeed = 0
	}

}

