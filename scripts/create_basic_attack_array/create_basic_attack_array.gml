//each basic attack need to be manually created
var basic_attack_array = array_create(1, 0)

basic_attack_array[0, 0] = 1//number of basic attacks
basic_attack_array[0, 1] = team.left
basic_attack_array[0, 2] = image_scale //seperate image scale of projectile
basic_attack_array[0, 3] = 5//gimbal_fire_angle
//for each basic attack
basic_attack_array[1, 0] = 5//basic speed
basic_attack_array[1, 1] = s_bullet_original //projectile resource
basic_attack_array[1, 2] = 10 //damage
basic_attack_array[1, 3] = projectile.light //damage_type
basic_attack_array[1, 4] = 0//length from origin
basic_attack_array[1, 5] = 0 //distance from origin
basic_attack_array[1, 6] = 50 //flight time in frames

return basic_attack_array