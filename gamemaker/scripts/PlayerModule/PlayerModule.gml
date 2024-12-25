#region FUNCTIONS
	// WEAPONS
	function add_weapon(_weapon)
	{
		if !array_contains(PlayerWeapons, _weapon)
		{
			array_push(PlayerWeapons, _weapon);	
		}
	}
	
	function remove_weapon(_weapon)
	{
		if array_contains(PlayerWeapons, _weapon)
		{
			var _index = array_get_index(PlayerWeapons, _weapon)
			array_delete(PlayerWeapons, _index, 1);
		}
	}
	
	
	// ITEMS
	function add_item(_item)
	{
		var _index = has_item(_item, true);
		if _index == false
		{
			array_push(PlayerItems, [_item, 1]);
		}
		else
		{
			PlayerItems[_index][1]++;
		}
	}
	
	function use_item(_item)
	{
		var _index = has_item(_item, true);
		if _index != false
		{
			PlayerItems[_index][1]--;
			if PlayerItems[_index][1] == 0
			{
				remove_item(_item);	
			}
		}
	}
	
	function remove_item(_item)
	{
		var _index = has_item(_item, true);
		if _index != false
		{
			array_delete(PlayerItems, _index, 1);	
		}
	}
	
	function has_item(_item, _returnIndex = false)
	{
		for (var i = 0; i < array_length(PlayerItems); i++)
		{
			if PlayerItems[i][0] == _item 
			{ 
				if _returnIndex { return i } else { return true }
			}
		}
		return false;
	}
#endregion

function init_PlayerModule()
{
	global._PlayerWeapons = [
		WeaponTypes.EnergyPistol,
		WeaponTypes.EnergyRifle,
		WeaponTypes.EnergyShotgun
	];
	global._PlayerItems = [
		["example", 2]
	];
	global._PlayerStats =
	{
		// placeholder	
	}
	#macro PlayerWeapons global._PlayerWeapons
	#macro PlayerItems global._PlayerItems
}

