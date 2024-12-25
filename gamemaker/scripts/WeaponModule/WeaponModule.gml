#region CLASSES
	function Weapon(_name, _sprite, _bulletType, _cooldown, _shoot = function(_xPos, _yPos, _dir) { spawn_bullet(bullet_type, _xPos, _yPos, _dir); } ) constructor 
	{
		name = _name;
		sprite = _sprite;
		bullet_type = _bulletType;
		cooldown = _cooldown;
	
		length = sprite_get_bbox_right(sprite) - sprite_get_xoffset(sprite);
		
		shoot = _shoot;
	}
#endregion

#region FUNCTIONS
	function draw_weapon(_weapon, _x, _y, _aimDir, _weaponOffsetDist = 0) {
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

function init_weaponModule()
{
	#region GLOBALS
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
			)
		}
		#macro WeaponTypes global._WeaponTypes
	#endregion
}