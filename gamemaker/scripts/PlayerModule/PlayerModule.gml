function draw_weapon() {
	var _xOffset = lengthdir_x(weapon_offset_dist, aim_dir);
	var _yOffset = lengthdir_y(weapon_offset_dist, aim_dir);

	var _weaponYScl = 1;
	if aim_dir > 90 && aim_dir < 270
	{
		_weaponYScl = -1;	
	}

	draw_sprite_ext(weapon.sprite, 0, x + _xOffset, center_y + _yOffset, 1, _weaponYScl, aim_dir, c_white, 1);
}