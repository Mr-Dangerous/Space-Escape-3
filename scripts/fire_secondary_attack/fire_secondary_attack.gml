//lead_target_stuff later
///@param secondary attack array SEE FUNCTION

var _secondary_attack_array = argument0

var _secondary_attack_number = _secondary_attack_array[0, 0]
var _secondary_attack_team = _secondary_attack_array[0, 1]
var _secondary_attack_image_scale = _secondary_attack_array[0, 2]

var _i = 1
repeat(_secondary_attack_number){
	gun_offset_length = secondary_attack_array[_i, 4]//length
	gun_offset_direction = image_angle + secondary_attack_array[_i, 5]//direction
	gun_offset_x = x+lengthdir_x(gun_offset_length, gun_offset_direction)
	gun_offset_y = y+lengthdir_y(gun_offset_length, gun_offset_direction)
	var _projectile = instance_create_layer(gun_offset_x, gun_offset_y, "Projectiles", o_projectile)
	with (_projectile){
		duration = _secondary_attack_array[_i, 6]
		image_scale = other.image_scale 
		image_xscale = other.image_scale * _secondary_attack_image_scale
		image_yscale = other.image_scale * _secondary_attack_image_scale
		image_angle = other.image_angle
		direction = image_angle
		speed = _secondary_attack_array[_i, 0]
		sprite_index = _secondary_attack_array[_i, 1]
		damage = _secondary_attack_array[_i, 2]
		team_attack_from = _secondary_attack_team
		damage_type = _secondary_attack_array[_i, 3]
	}
	_i++
}