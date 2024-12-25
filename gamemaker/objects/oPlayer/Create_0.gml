#region VARIABLES
	move_speed = 2;
	move_dir = 0;

	xspeed = 0;
	yspeed = 0;
#endregion

#region SPRITE CONTROL
	center_y_offset = -6;
	center_y = y + center_y_offset; // set in step event
	
	weapon_offset_dist = 4;
	
	aim_dir = 0;
	
	face = 3;
	sprite = [
		sPlayerRight, 
		sPlayerUp, 
		sPlayerLeft, 
		sPlayerDown
	];
#endregion
	
#region WEAPON
	weapon = WeaponTypes.EnergyPistol;
	shoot_timer = 0;
#endregion