/// @description Insert description here
// You can write your code in this editor
/*
_p_dir = point_direction(other.x, other.y, x, y)

motion_add(_p_dir, .1)
*/

//damage on collision



//Modules and abilities
if (serrated_plates != 0){//BUG
	//deal damage!
	if (other.ship_team != ship_team){
		if (other.serrated_plates_damage_counter = 0){
			other.serrated_plates_damage_counter = 15
			//need to figure out damage through a script!
			other.armor -= 15

		}
	}
}
if (wave_crasher_shield != 0 and speed >= max_speed-.05){
	//ALSO NEEDS A CHECK TO SEE IF GOING AT MAX SPEED
	if (other.ship_team != ship_team){//set up like this for nwo for testing purposes
		if (other.wave_crasher_shield_damage_counter = 0){
			other.wave_crasher_shield_damage_counter = 15
			//generate the direction to add motion
			generate_shields = 10
			var _p_dir = point_direction(x, y, other.x, other.y)
			var _p_distance = point_distance(x, y, other.x, other.y)
			var _force = (6/other.mass)//defintely needs to be tweaked
			with (other){
				ship_disabled_counter = 60

				motion_add(_p_dir, _force)
				
			}
			other.armor -= 15
		}
	}
}