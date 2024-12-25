if aim_dir >= 0 && aim_dir < 180
{
	draw_weapon(weapon, x, y, aim_dir, weapon_offset_dist);
}

draw_self();

if aim_dir >= 180 && aim_dir < 360
{
	draw_weapon(weapon, x, y, aim_dir, weapon_offset_dist);
}