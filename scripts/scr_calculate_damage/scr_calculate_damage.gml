
///@param targeted_ship
///@param damage
///@param projectile_weight
var targeted_ship = argument0
var _damage = argument1


var _temporary_shields = targeted_ship.temporary_shields
var _shields = targeted_ship.shields
var _armor = targeted_ship.armor
	
var _damage_to_shields = 0
var _damage_to_temporary_shields = 0

	
if (_temporary_shields > 0 and _damage > 0){
	targeted_ship.generate_shields = 9
	_damage_to_temporary_shields = _temporary_shields-_damage
	if (sign(_damage_to_temporary_shields) = -1){
		_damage = _damage_to_temporary_shields*-1
		targeted_ship.temporary_shields = 0
		temporary_shield_counter = 0
	} else {
		targeted_ship.temporary_shields -= _damage
		_damage = 0
	}
}
if (_shields > 0 and _damage > 0){
	targeted_ship.generate_shields = 9
	_damage_to_shields = targeted_ship.shields-_damage
	if (sign(_damage_to_shields) = -1){
		_damage = _damage_to_shields*-1
		targeted_ship.shields = 0
	} else {
		targeted_ship.shields -= _damage
		_damage = 0
	}
}
if (_armor > 0 and _damage > 0){
	targeted_ship.armor -= _damage
	if(targeted_ship.armor < 0){
		targeted_ship.armor = 0
	}
}