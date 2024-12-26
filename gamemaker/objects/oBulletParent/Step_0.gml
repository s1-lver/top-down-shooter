xspeed = lengthdir_x(spd, dir);
yspeed = lengthdir_y(spd, dir);

x += xspeed;
y += yspeed;

if destroy { instance_destroy(); }

#region DESTRUCTION CHECK
	if place_meeting(x, y, oProjectileWall) { destroy = true; }

	if point_distance(xstart, ystart, x, y) > max_dist { destroy = true; }
#endregion
