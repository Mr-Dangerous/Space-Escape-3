var _object_type = object_index
#region baseline variables
var _armor = 300
var _shields = 100
var _basic_attack_speed = 40 // divide by 60 for attacks per second
var _basic_attack_number = 2 //quantity of attacks per attack
var _basic_attack_damage = 15 
var _basic_attack_mass = 2
var _basic_attack_range = 100 //shortish range
var _max_speed = 3
var _turn_speed = 5
var _acceleration_rate = .5
var _energy_starting = 0
var _energy_to_cast = 20 //
var _energy_regeneration = 1
#endregion









//everything below this line gets loaded!
if (_object_type = o_ship){
	#region Graphic things
	//load the sprite
	sprite_index = s_iron_interceptor_original
	var _sprite_length
	if (sprite_height > sprite_width){
		_sprite_length = sprite_height
	} else { 
		_sprite_length = sprite_width
	}
	image_scale = small_ship_size / _sprite_length
	image_xscale = image_scale
	image_yscale = image_scale
	visible = true



	//Weapon visual offsets
	/*
	Weapon 1 offsets are the x and y offsets on the base image.
	Using the length offset and direction offset, a lengthdir_x and y
	function can generate bullets from the desired location.
	*/
	var weapon_1_base_x_offset = 334 //orginal sprite
	var weapon_1_base_y_offset = -124 //orginal sprite
	//length including adjusments for image scale
	var weapon_1_length_offset = point_distance(0, 0, (weapon_1_base_x_offset * image_scale), (weapon_1_base_y_offset * image_scale))
	//base direction offset
	var weapon_1_direction_offset = point_direction(0, 0, (weapon_1_base_x_offset * image_scale), (weapon_1_base_y_offset* image_scale))


	var weapon_2_base_x_offset = 334 //orginal sprite
	var weapon_2_base_y_offset = 124 //orginal sprite
	//length including adjusments for image scale
	var weapon_2_length_offset = point_distance(0, 0, (weapon_2_base_x_offset * image_scale), (weapon_2_base_y_offset * image_scale))
	//base direction offset
	var weapon_2_direction_offset = point_direction(0, 0, (weapon_2_base_x_offset * image_scale), (weapon_2_base_y_offset* image_scale))

	var weapon_3_base_x_offset = -254 //orginal sprite
	var weapon_3_base_y_offset = 467 //orginal sprite
	//length including adjusments for image scale
	var weapon_3_length_offset = point_distance(0, 0, (weapon_3_base_x_offset * image_scale), (weapon_3_base_y_offset * image_scale))
	//base direction offset
	var weapon_3_direction_offset = point_direction(0, 0, (weapon_3_base_x_offset * image_scale), (weapon_3_base_y_offset* image_scale))


	var weapon_4_base_x_offset = -254 //orginal sprite
	var weapon_4_base_y_offset = -467 //orginal sprite
	//length including adjusments for image scale
	var weapon_4_length_offset = point_distance(0, 0, (weapon_4_base_x_offset * image_scale), (weapon_4_base_y_offset * image_scale))
	//base direction offset
	var weapon_4_direction_offset = point_direction(0, 0, (weapon_4_base_x_offset * image_scale), (weapon_4_base_y_offset* image_scale))


	
	var secondary_number_of_weapons = 2

	weapon_visual_offsets[0, 0] = weapon_1_length_offset
	weapon_visual_offsets[0, 1] = weapon_1_direction_offset
	weapon_visual_offsets[1, 0] = weapon_2_length_offset
	weapon_visual_offsets[1, 1] = weapon_2_direction_offset
	weapon_visual_offsets[2, 0] = weapon_3_length_offset
	weapon_visual_offsets[2, 1] = weapon_3_direction_offset
	weapon_visual_offsets[3, 0] = weapon_4_length_offset
	weapon_visual_offsets[3, 1] = weapon_4_direction_offset

	basic_attack_array[0, 0] = _basic_attack_number
	basic_attack_array[0, 1] = ship_team
	basic_attack_array[0, 2] = image_scale
	basic_attack_array[0, 4] = _basic_attack_mass

	secondary_attack_array[0, 0] = secondary_number_of_weapons
	secondary_attack_array[0, 1] = ship_team
	secondary_attack_array[0, 2] = image_scale


	for (var i = 1; i <= _basic_attack_number; i++){

		basic_attack_array[i, 0] = 5 //projectile speed
		basic_attack_array[i, 1] = s_bullet_original //projectile graphic
		basic_attack_array[i, 2] = _basic_attack_damage //damage
		basic_attack_array[i, 3] = projectile.light //damage_type//DEPRECATED?
		basic_attack_array[i, 4] = weapon_visual_offsets[i-1, 0] //length from origin
		basic_attack_array[i, 5] = weapon_visual_offsets[i-1, 1]//distance from origin
		basic_attack_array[i, 6] = _basic_attack_range //duration, or range really.
	}

	for (var i = 1; i <= secondary_number_of_weapons; i++){
		secondary_attack_array[i, 0] = 0
		secondary_attack_array[i, 1] = 0
		secondary_attack_array[i, 2] = 0
		secondary_attack_array[i, 3] = 0
		secondary_attack_array[i, 4] = weapon_visual_offsets[i+_basic_attack_number-1, 0] //length from origin
		secondary_attack_array[i, 5] = weapon_visual_offsets[i+_basic_attack_number-1, 1]//distance from origin
		secondary_attack_array[i, 6] = 0
	}

	#region exhausts
	var _exhaust_1_x_offset = -328*image_scale
	var _exhaust_1_y_offset = 0*image_scale



	exhaust_array[0, 0] = point_direction(0, 0, _exhaust_1_x_offset, _exhaust_1_y_offset)
	exhaust_array[0, 1] = point_distance(0, 0, _exhaust_1_x_offset, _exhaust_1_y_offset)


	#endregion
	#endregion

	

	#region Baseline variables
	shields = _shields
	armor = _armor
	max_speed = _max_speed
	acceleration_rate = _acceleration_rate
	turn_speed = _turn_speed
	fire_rate = _basic_attack_speed
	class = target_class.interceptor
	origin = origin_iron
	sub_class = class_ECP
	#endregion
}
if (_object_type = o_ship_factory){

}