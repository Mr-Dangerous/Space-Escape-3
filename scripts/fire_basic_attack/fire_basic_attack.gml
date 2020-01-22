//lead_target_stuff later
///@param basic attack array SEE FUNCTION

var _basic_attack_array = argument0

var _basic_attack_number = _basic_attack_array[0, 0]
var _basic_attack_team = _basic_attack_array[0, 1]
var _basic_attack_image_scale = _basic_attack_array[0, 2]
var _origin_ship = self

var _i = 1
repeat(_basic_attack_number){
	var gun_offset_length = _basic_attack_array[_i, 4]//length
	var gun_offset_direction = image_angle + _basic_attack_array[_i, 5]//direction
	var gun_offset_x = x+lengthdir_x(gun_offset_length, gun_offset_direction)
	var gun_offset_y = y+lengthdir_y(gun_offset_length, gun_offset_direction)
	var _projectile = instance_create_layer(gun_offset_x, gun_offset_y, "Projectiles", o_projectile)
	var _weapon_range = _basic_attack_array[_i, 0]*_basic_attack_array[_i, 6]
	
	var _angle_multiplier = 100/_weapon_range
	//needs to be some math here!
	var _convergence_angle_offset = 0
	if (_basic_attack_array[_i, 5] > 0 and _basic_attack_array[_i, 5] < 180){
		//attack will have slight negative angle to focus
		_convergence_angle_offset -= 7*_angle_multiplier
	}
	if (_basic_attack_array[_i, 5] > 180 and _basic_attack_array[_i, 5] < 360){
		//attack will have slight positive angle to focus
		_convergence_angle_offset += 7*_angle_multiplier
	}
	
	
	
	var _convergence_angle = image_angle + _convergence_angle_offset
	with (_projectile){
		duration = _basic_attack_array[_i, 6]
		image_xscale = _basic_attack_image_scale
		image_yscale = _basic_attack_image_scale
		image_angle = _convergence_angle
		direction = _convergence_angle
		speed = _basic_attack_array[_i, 0]
		sprite_index = _basic_attack_array[_i, 1]
		damage = _basic_attack_array[_i, 2]
		team_attack_from = _basic_attack_team
		damage_type = _basic_attack_array[_i, 3]
		mass = _basic_attack_array[0, 4]
		directional_damage = _basic_attack_array[0, 5]
		origin_ship = other
	}
	_i++
}



