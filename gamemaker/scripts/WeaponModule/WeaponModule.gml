#region CLASSES
	function Bullet(_sprite, _speed, _damage, _maxRange = 500) constructor {
		sprite = _sprite;
		spd = _speed;
		damage = _damage;
		max_range = _maxRange;
	}
	
	function Weapon(_name, _sprite, _bulletType, _cooldown, _spread = 0, _numberOfBullets = 1, _shoot = function(_xPos, _yPos, _dir) { shoot_bullet_spread(number_of_bullets, spread, bullet_type, _xPos, _yPos, _dir); } ) constructor 
	{
		name = _name;
		sprite = _sprite;
		bullet_type = _bulletType;
		spread = _spread;
		number_of_bullets = _numberOfBullets;
		cooldown = _cooldown;
	
		length = sprite_get_bbox_right(sprite) - sprite_get_xoffset(sprite);
		
		shoot = _shoot;
	}
#endregion

#region FUNCTIONS
	function spawn_bullet(_type, _xPos, _yPos, _dir) 
	{
		var new_bullet = instance_create_depth(_xPos, _yPos, oPlayer.depth - 100, oBullet);
	
		with (new_bullet)
		{
			x = _xPos;
			y = _yPos;
			dir = _dir;
			spd = _type.spd;
			
			max_dist = _type.max_range;
			
			sprite_index = _type.sprite;
		}

		return new_bullet;
	}
	
	function shoot_bullet_spread(_noBullets, _spread, _type, _xPos, _yPos, _dir)
	{
		if _noBullets == 1
		{
			spawn_bullet(_type, _xPos, _yPos, _dir);
		}
		else
		{
			var _angleBetweenBullet = _spread /  (_noBullets - 1);
			for (var i = 0; i < _noBullets; i++)
			{
				spawn_bullet(_type, _xPos, _yPos, _dir - (_spread / 2) + _angleBetweenBullet * i);
			}
		}
	}
	
	function draw_weapon(_weapon, _x, _y, _aimDir, _weaponOffsetDist = 0) 
	{
		var _xOffset = lengthdir_x(_weaponOffsetDist, _aimDir);
		var _yOffset = lengthdir_y(_weaponOffsetDist, _aimDir);

		var _weaponYScl = 1;
		if _aimDir > 90 && _aimDir < 270
		{
			_weaponYScl = -1;	
		}

		draw_sprite_ext(_weapon.sprite, 0, x + _xOffset, center_y + _yOffset, 1, _weaponYScl, aim_dir, c_white, 1);
	}
#endregion 

function init_WeaponModule()
{
	global._BulletTypes = 
	{
		EnergyBullet : new Bullet(
			sEnergyRifleBullet,
			5, 
			5
		),
		SmallEnergyBullet : new Bullet(
			sEnergyPistolBullet, 
			7, 
			2,
			250
		),
		EnergyPellet : new Bullet( 
			sEnergyShotgunBullet,
			4,
			10,
			150
		)
	}
	#macro BulletTypes global._BulletTypes
	
	global._WeaponTypes =
	{
		EnergyRifle : new Weapon(
			"Energy Rifle", 
			sEnergyRifle, 
			BulletTypes.EnergyBullet,
			9
		),
		EnergyPistol : new Weapon(
			"Energy Pistol", 
			sEnergyPistol, 
			BulletTypes.SmallEnergyBullet, 
			18
		),
		EnergyShotgun : new Weapon( 
			"Energy Shotgun",
			sEnergyShotgun,
			BulletTypes.EnergyPellet,
			36,
			45,
			3	
		)
	}
	#macro WeaponTypes global._WeaponTypes
}