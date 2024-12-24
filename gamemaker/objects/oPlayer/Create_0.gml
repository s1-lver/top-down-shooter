// MOVEMENT
	move_speed = 2;
	move_dir = 0;

	xspeed = 0;
	yspeed = 0;

// SPRITE CONTROL
	center_y_offset = -5;
	center_y = y + center_y_offset; // set in step event
	
	aim_dir = 0;
	
	face = 3;
	sprite = [
		sPlayerRight, 
		sPlayerUp, 
		sPlayerLeft, 
		sPlayerDown
	];