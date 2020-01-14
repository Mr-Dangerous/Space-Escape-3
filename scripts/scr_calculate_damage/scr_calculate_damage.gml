
///@param targeted_ship
///@param damage
///@param weapon_weight
///@param directional_damage
/*
Weapons have mass.  If the mass is 0, the weapon is an energy weapon.  
If the mass is 10, it is a piercing weapon.  WEapon weight is between 1 and 9
Some weapons care about the relative direction og the projectile and the target.  Others don't.
*/


var targeted_ship = argument0
var _damage = argument1
var _projectile_mass = argument2
var _directional_damage = argument3


var _temporary_shields = targeted_ship.temporary_shields
var _shields = targeted_ship.shields
var _armor = targeted_ship.armor
var _max_mass_shield_can_deflect = targeted_ship.max_mass_shield_can_deflect

var _forward_shield_strength = targeted_ship.shield_forward_strength
var _left_shield_strength = targeted_ship.shield_left_strength
var _right_shield_strength = targeted_ship.shield_right_strength
var _rear_shield_strength = targeted_ship.shield_rear_strength

//check to see if the ship has shields
if (_shields > 0){
	//subtract the mass from the the shields
	if (_projectile_mass > 0 and _projectile_mass < _max_mass_shield_can_deflect){
		targeted_ship.shields -= _projectile_mass
		//find which shield strength to use
		var _directional_strength = 0
		var _shot_deflected = false
		var _impact_direction = point_direction(x, y, targeted_ship.x, targeted_ship.y)
		var _impact_angle_difference = angle_difference(_impact_direction, targeted_ship.image_angle)
		if (_directional_damage){
			if (_impact_angle_difference > 135 or _impact_angle_difference < -135){
				_directional_strength = _forward_shield_strength
			}
			if (_impact_angle_difference > -135 and _impact_angle_difference < -45){
				_directional_strength = _right_shield_strength
			}
			if (_impact_angle_difference < 135 and _impact_angle_difference > 45){
				_directional_strength = _left_shield_strength
			}
			if (_impact_angle_difference > -45 and _impact_angle_difference < 45){
				_directional_strength = _rear_shield_strength
			}
			
		}
		//calculate damage
		var _d100 = irandom(99)
		if (_d100 < _directional_strength){
			_shot_deflected = true
		}
		if (_shot_deflected = true){
			
		}
		if (_shot_deflected = false){
			armor -= _damage/2
		}
	}
}

