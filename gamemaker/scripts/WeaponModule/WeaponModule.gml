#region CLASSES
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
		var new_bullet = instance_create_depth(_xPos, _yPos, oPlayer.depth - 100, _type);
	
		with (new_bullet)
		{
			x = _xPos;
			y = _yPos;
			dir = _dir;
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
	global._WeaponTypes =
	{
		EnergyRifle : new Weapon(
			"Energy Rifle", 
			sEnergyRifle, 
			oEnergyBullet,
			9
		),
		EnergyPistol : new Weapon(
			"Energy Pistol", 
			sEnergyPistol, 
			oSmallEnergyBullet, 
			18
		),
		EnergyShotgun : new Weapon( 
			"Energy Shotgun",
			sEnergyShotgun,
			oEnergyPellet,
			36,
			45,
			3	
		)
	}
	#macro WeaponTypes global._WeaponTypes
}