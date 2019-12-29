fire_rate_counter = 0
fire_rate = 10


for (var  i = 1; i < basic_attack_array[0,0]+1; i++){
	basic_attack_array[@i, 0] = 10//projectile_speed, 5 is base
	basic_attack_array[@i, 1] = s_bullet_purple_original //for now
	basic_attack_array[@i, 2] = 10//damage
	basic_attack_array[@i, 3] = projectile.light
	basic_attack_array[@i, 6] /= 2
}