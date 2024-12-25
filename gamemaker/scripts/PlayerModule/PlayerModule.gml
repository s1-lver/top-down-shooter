function init_PlayerModule()
{
	#region GLOBALS
		global._PlayerWeapons = [
			WeaponTypes.EnergyPistol,
			WeaponTypes.EnergyRifle
		];
		#macro PlayerWeapons global._PlayerWeapons
	#endregion

	function add_to_weapons(_item)
	{
		array_push(PlayerWeapons, _item);	
	}
}

