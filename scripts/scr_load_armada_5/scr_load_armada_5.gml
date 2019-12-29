
//Each module should have a nice description
/*
This module is effectively a light machine gun. It has a very fast fire rate
and light damage.
*/

fire_rate_counter = 0
fire_rate = 10

var _damage = 10
var _projectile_speed = 10
var _projectile_damage_type = projectile.light
var _duration_divisor = _projectile_speed/5
var _projectile_resource = s_bullet_purple_original


for (var  i = 1; i < basic_attack_array[0,0]+1; i++){
	basic_attack_array[@i, 0] = _projectile_speed
	basic_attack_array[@i, 1] = _projectile_resource
	basic_attack_array[@i, 2] = _damage
	basic_attack_array[@i, 3] = _projectile_damage_type
	basic_attack_array[@i, 6] /= _duration_divisor
}