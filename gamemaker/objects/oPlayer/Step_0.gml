#region INPUTS
	var right_key = keyboard_check(vk_right);
	var left_key = keyboard_check(vk_left);
	var up_key = keyboard_check(vk_up);
	var down_key = keyboard_check(vk_down);
#endregion

#region MOVEMENT
	var _hKey = right_key - left_key;
	var _vKey = down_key - up_key;
	move_dir = point_direction(0, 0, _hKey, _vKey);

	var _spd = 0;
	var _inputLevel = clamp(point_distance(0, 0, _hKey, _vKey), 0, 1); // 0 or 1
	_spd = move_spd * _inputLevel;
	
	xspeed = lengthdir_x(_spd, move_dir);
	yspeed = lengthdir_y(_spd, move_dir);
	
	// Check Collisions
	if place_meeting(x + xspeed, y, oEntityWall)
	{
		xspeed = 0;	
	}
	if place_meeting(x, y + yspeed, oEntityWall)
	{
		yspeed = 0;
	}
	
	x += xspeed;
	y += yspeed;
#endregion
