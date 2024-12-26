#region PLAYER CHASING/MOVEMENT
	if instance_exists(oPlayer)
	{
		move_dir = point_direction(x, y, oPlayer.x, oPlayer.y);
	
		xspeed = lengthdir_x(move_speed, move_dir);
		yspeed = lengthdir_y(move_speed, move_dir);
	}
	
	// COLLISIONS
	if place_meeting(x + xspeed, y, oEntityWall) || place_meeting(x + xspeed, y, oEnemyParent)
	{
		xspeed = 0;	
	}
	if place_meeting(x, y + yspeed, oEntityWall) || place_meeting(x, y + yspeed, oEnemyParent)
	{
		yspeed = 0;	
	}
	
	x += xspeed;
	y += yspeed;
#endregion

#region ANIMATE
	var _speed = point_distance(0, 0, xspeed, yspeed);
	if _speed < 0.1 { image_index = 0; }
	
	if xspeed > 0 { face = 1; } 
	else if xspeed < 0 { face = -1; }
	
	depth = -y;
#endregion

event_inherited();