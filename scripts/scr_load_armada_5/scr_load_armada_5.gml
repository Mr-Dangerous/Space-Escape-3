
//Each module should have a nice description
/*
This module is effectively a light machine gun. It has a very fast fire rate
and light damage.
*/

secondary_fire_rate_counter = 0
secondary_fire_rate = 10
secondary_attack_array[0,0] = 2
secondary_attack_array[0,2] = image_scale

var _damage = weapon_damage_level_1
var _projectile_speed = 10
var _projectile_damage_type = projectile.light
var _projectile_resource = s_bullet_purple_original


for (var  i = 1; i < secondary_attack_array[0,0]+1; i++){
	secondary_attack_array[i, 0] = _projectile_speed
	secondary_attack_array[i, 1] = _projectile_resource
	secondary_attack_array[i, 2] = _damage
	secondary_attack_array[i, 3] = _projectile_damage_type
	secondary_attack_array[i, 6] = close_range
}

show_debug_message("module loaded!")