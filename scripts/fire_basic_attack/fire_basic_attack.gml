//lead_target_stuff later
///@param basic attack array SEE FUNCTION

var _basic_attack_array = argument0

var _basic_attack_number = _basic_attack_array[0, 0]
var _basic_attack_team = _basic_attack_array[0, 1]
var _basic_attack_image_scale = _basic_attack_array[0, 2]

var _i = 1
repeat(_basic_attack_number){
	var gun_offset_length = _basic_attack_array[_i, 4]//length
	var gun_offset_direction = image_angle + _basic_attack_array[_i, 5]//direction
	var gun_offset_x = x+lengthdir_x(gun_offset_length, gun_offset_direction)
	var gun_offset_y = y+lengthdir_y(gun_offset_length, gun_offset_direction)
	var _projectile = instance_create_layer(gun_offset_x, gun_offset_y, "Projectiles", o_projectile)
	with (_projectile){
		duration = _basic_attack_array[_i, 6]
		image_xscale = _basic_attack_image_scale
		image_yscale = _basic_attack_image_scale
		image_angle = other.image_angle
		direction = image_angle
		speed = _basic_attack_array[_i, 0]
		sprite_index = _basic_attack_array[_i, 1]
		damage = _basic_attack_array[_i, 2]
		team_attack_from = _basic_attack_team
		damage_type = _basic_attack_array[_i, 3]
	}
	_i++
}



