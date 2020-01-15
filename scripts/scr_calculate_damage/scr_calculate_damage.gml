
///@param targeted_ship
///@param damage
///@param weapon_weight
///@param directional_damage
/*
This instance must always be called by the damage source, such as a projectile or missile.

Weapons have mass.  If the mass is 0, the weapon is an energy weapon.  
If the mass is 10, it is a piercing weapon.  WEapon weight is between 1 and 9
Some weapons care about the relative direction of the projectile and the target.  Others don't.

as of right now, the angle difference is based on a measure of the point direction when the projectile impacts the body, measuring the projectiles x and y and the targets x and y
it doesn't care about the image angle of the projectile
if I wanted to, I could have another angle difference in there
based on the direction to the center of the colliding body compared to the image angle of the projectile
perhaps, if the angle difference between the projectiles image angle and the actual angle of impact is great enough, it can further reduce damage
I like the way you think
i'll include a note, but Ill code it later

*/


var targeted_ship = argument0
var _damage = argument1
var _projectile_mass = argument2
var _directional_damage = argument3


var _temporary_shields = targeted_ship.temporary_shields
var _shields = targeted_ship.shields
var _max_mass_shield_can_deflect = targeted_ship.max_mass_shield_can_deflect

var _forward_shield_strength = targeted_ship.shield_forward_strength//default 100
var _left_shield_strength = targeted_ship.shield_left_strength//default 60
var _right_shield_strength = targeted_ship.shield_right_strength//default 60
var _rear_shield_strength = targeted_ship.shield_rear_strength//default 15

//check to see if the ship has shields
if (_shields > 0){
	//subtract the mass from the the shields
	if (_projectile_mass > 0 and _projectile_mass < _max_mass_shield_can_deflect){
		if (_temporary_shields > 0){
			targeted_ship.temporary_shields -= ceil(_projectile_mass)
			
		} else {
			targeted_ship.shields -= ceil(_projectile_mass)
		}
		if (targeted_ship.generate_shields <= _projectile_mass*2){
			targeted_ship.generate_shields = _projectile_mass*2
		}
		
		//find which shield strength to use
		var _directional_strength = 0
		var _shot_deflected = false
		//note that this instance will always be called by the damage source
		//so it will call it's x and y position
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
			_damage = 0
			//code to have the shot go flying maybe?
		}
		if (_shot_deflected = false){
			var _damage_reduction = (9-_projectile_mass)
			if (_damage_reduction > 0){
				_damage/=_damage_reduction
			}
		}
	} else {
		if (_projectile_mass > _max_mass_shield_can_deflect){
			if (_temporary_shields > 0){
				targeted_ship.temporary_shields -= _max_mass_shield_can_deflect
			} else {
				targeted_ship.shields -= _max_mass_shield_can_deflect
			}
			targeted_ship.generate_shields = 10
		}
		if (_projectile_mass = 0){
			if (_temporary_shields > 0){
				targeted_ship.temporary_shields -= _damage
			} else {
				targeted_ship.shields -= _damage
			}
			targeted_ship.generate_shields = 10
		}
	}
}
if (_damage > 0){
	targeted_ship.armor -= ceil(_damage)
}



