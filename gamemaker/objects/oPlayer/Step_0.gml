#region INPUTS
	var left_key = keyboard_check(vk_left) || keyboard_check(ord("A"));
	var right_key = keyboard_check(vk_right) || keyboard_check(ord("D"));
	var up_key = keyboard_check(vk_up) || keyboard_check(ord("W"));
	var down_key = keyboard_check(vk_down) || keyboard_check(ord("S"));
#endregion

#region MOVEMENT
	var _hInput = right_key - left_key;
	var _vInput = down_key - up_key;
	
	var _inputLevel = clamp(point_distance(0, 0, _hInput, _vInput), 0, 1);
	var _spd = _inputLevel * move_speed;
	
	move_dir = point_direction(0, 0, _hInput, _vInput);
	
	xspeed = lengthdir_x(_spd, move_dir);
	yspeed = lengthdir_y(_spd, move_dir);
	
	if place_meeting(x + xspeed, y, oEntityWall)
	{
		xspeed = 0;	
	}
	if place_meeting(x, y + yspeed, oEntityWall)
	{
		yspeed = 0;
	}
	
	depth = -bbox_bottom;
	
	x += xspeed;
	y += yspeed;
#endregion

#region AIM CONTROl
	center_y = y + center_y_offset;
	
	aim_dir = point_direction(x, center_y, mouse_x, mouse_y);
#endregion

#region SPRITE CONTROL
	face = round(aim_dir / 90);
	if face == 4 { face = 0; }
	
	if (_spd = 0) { image_index = 0; }
	
	sprite_index = sprite[face];
#endregion