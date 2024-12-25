#region INPUTS
	var left_key = keyboard_check(vk_left) || keyboard_check(ord("A"));
	var right_key = keyboard_check(vk_right) || keyboard_check(ord("D"));
	var up_key = keyboard_check(vk_up) || keyboard_check(ord("W"));
	var down_key = keyboard_check(vk_down) || keyboard_check(ord("S"));
	var shoot_key = mouse_check_button(mb_left);
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

#region AIM CONTROL
	center_y = y + center_y_offset;
	
	aim_dir = point_direction(x, center_y, mouse_x, mouse_y);
#endregion

#region SPRITE CONTROL
	face = round(aim_dir / 90);
	if face == 4 { face = 0; }
	
	if (_spd = 0) { image_index = 0; }
	
	sprite_index = sprite[face];
#endregion

#region	SHOOTING CONTROL
	if shoot_timer > 0 { shoot_timer--; }

	if shoot_key && shoot_timer <= 0
	{
		shoot_timer = weapon.cooldown;
		
		var _xOffset = lengthdir_x(weapon.length + weapon_offset_dist, aim_dir);
		var _yOffset = lengthdir_y(weapon.length + weapon_offset_dist, aim_dir);
		
		weapon.shoot(x + _xOffset, center_y + _yOffset, aim_dir);
	} 
#endregion