#region CONSTANTS
	global._BulletTypes = 
	{
		EnergyBullet : new Bullet(sEnergyRifleBullet, 5, 5),
		SmallEnergyBullet : new Bullet(sEnergyPistolBullet, 7, 2)
	}
	#macro BulletTypes global._BulletTypes
#endregion

#region CLASSES
	function Bullet(_sprite, _speed, _damage) constructor {
		sprite = _sprite;
		spd = _speed;
		damage = _damage;
	}
#endregion


function spawn_bullet(_type, _xPos, _yPos, _dir) {
	var new_bullet = instance_create_depth(_xPos, _yPos, oPlayer.depth - 100, oBullet);
	
	with (new_bullet)
	{
		x = _xPos;
		y = _yPos;
		dir = _dir;
		spd = _type.spd;
		
		sprite_index = _type.sprite;
	}

	return new_bullet;
}