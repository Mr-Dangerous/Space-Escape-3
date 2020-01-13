/// @description Insert description here
//shop slots
for (var i = 0; i < 5; i++){
	shop_slots[i, 0] = noone//the object resource
	shop_slots[i, 1] = noone//the actual object being referenced
}
//parts bin slots
number_of_parts_slots = 15
parts_slot = array_create(number_of_parts_slots, noone)


//Player variables
player_experience = 0
player_level = 1

//Economy variables
current_fuel_spent = 0
resources = 10
base_income = 5
streak_income = 0
investment_income = 0
level_income = floor(player_level/2)
bonus_income = 0
income = base_income + streak_income + level_income + bonus_income

//Game mangement variables
current_turn = 1
max_fuel = 5 + player_level*3

//Fleet management variables
left_fleet = array_create(35, noone)
right_fleet = array_create(35, noone)






//player experience levels
experience_to_level = scr_create_player_experience_levels()

#region GUI locations and variables
//resolution variables
gui_height = view_get_hport(0)
gui_width = view_get_wport(0)
resolution_scale = view_get_wport(0)/camera_get_view_width(view_camera[0])
//Buttons

invest_button_pressed = false
refresh_button_pressed = false
hangar_button_pressed = false

//generate UI arrays
//generate shop position arrays
shop_slot_ui_x_offset = array_create(5, 0)//this array is the x position of the shop slots
shop_slot_ui_y_offset = gui_height - (161*resolution_scale)//card height with 8 pixel border
for (var i = 0; i < 5; i++){
	shop_slot_ui_x_offset[i] = (347 + (i*245))*resolution_scale
}
//generate text positions for resources
resource_ui_x_offset = array_create(3, 0)//this array is the x position of the resources ui
resource_x_offset = array_create(3, 0) //for hovering for infor
resource_ui_y_offset = gui_height - (190*resolution_scale)
resource_y_offset = room_height - (210)
resource_elements = 6
base_resource_offset = (360)
//These used to be for loops, but needed to change to allow for individual formatting
resource_ui_x_offset[0] = (base_resource_offset + 2)*resolution_scale//income
resource_ui_x_offset[1] = (base_resource_offset + 130)*resolution_scale//resources
resource_ui_x_offset[2] = (base_resource_offset + 320)*resolution_scale//turn
resource_ui_x_offset[3] = (base_resource_offset + 530)*resolution_scale//fuel
resource_ui_x_offset[4] = (base_resource_offset + 660)*resolution_scale//investment
resource_ui_x_offset[5] = (base_resource_offset + 880)*resolution_scale//infratructure level
resource_x_offset[0] = (base_resource_offset + 2)//income
resource_x_offset[1] = (base_resource_offset + 130)//resources
resource_x_offset[2] = (base_resource_offset + 320)//turn
resource_x_offset[3] = (base_resource_offset + 530)//fuel
resource_x_offset[4] = (base_resource_offset + 660)//investment
resource_x_offset[5] = (base_resource_offset + 880)//infratructure level


//generate parts bin position array

parts_slot_ui_x_offset = array_create(15, 0)//this array is the x position of the parts bin
parts_slot_x_offset = array_create(15, 0)
parts_slot_ui_y_offset = gui_height - (235*resolution_scale)
parts_slot_y_offset = room_height - (235)
for (var i = 0; i < number_of_parts_slots; i++){
	parts_slot_ui_x_offset[i] = (385 + round((i* 81.6)))*resolution_scale
}
for (var i = 0; i < number_of_parts_slots; i++){
	parts_slot_x_offset[i] = (385 + round((i* 81.6)))
}
//generate construction bay position array

construction_bay_slot_ui_x_offset = gui_width - (264 * resolution_scale)
construction_bay_slot_ui_y_offset = array_create(3, 0)
construction_bay_slot_x_offset = room_width - 264
construction_bay_slot_y_offset = array_create(3,0)

//generate the positions for the refresh, hangar, and invest button
invest_button_image = s_button_upgrade_resized
invest_button_ui_x_offset = shop_slot_ui_x_offset[0] - 4
invest_button_ui_y_offset = shop_slot_ui_y_offset

refresh_button_image = s_button_refresh_resized
refresh_button_ui_x_offset = invest_button_ui_x_offset
refresh_button_ui_y_offset = invest_button_ui_y_offset + (42)

hangar_button_image = s_button_hangar_resized
hangar_button_ui_x_offset = invest_button_ui_x_offset
hangar_button_ui_y_offset = invest_button_ui_y_offset + (84)


//generate the x and y offsets for elements on each card
card_offset_sprite_x = round(179*resolution_scale)//the ships x_offset from the left top side of the card
card_offset_sprite_y = round(75*resolution_scale)//the ships y offset from the left top
card_text_offset_x = round(16*resolution_scale) // all card text will be the same x_offset
card_name_offset_y = round(20*resolution_scale)
card_class_offset_y = round(65*resolution_scale)
card_origin_offset_y = round(120*resolution_scale)
card_resource_cost_x = round(198*resolution_scale)
card_resource_cost_y = round(40*resolution_scale)



#endregion

#region Creation Variables


//create the factories
ship_factories = array_create(16, noone)
factory_positions = array_create(16, [0, 0])
var _base_x_offset = 80
var _base_y_offset = 80
var _spacing = 130
for (var i = 0; i < 8; i++){
	factory_positions[i, 0] = _base_x_offset //x position
	factory_positions[i, 1] = _base_y_offset + (i*_spacing)
	factory_positions[i+8, 0] = _base_x_offset + _spacing
	factory_positions[i+8, 1] = _base_y_offset + (i*_spacing)
}
var _factory_array_size = array_length_1d(factory_positions)
for (var i = 0; i < _factory_array_size; i++){
	if (factory_positions[i, 0] != 0){
		_x = factory_positions[i, 0]
		_y = factory_positions[i, 1]
		var _factory = instance_create_layer(_x, _y, "Cards", o_ship_factory)
		with (_factory){
			card_game_controller = other
		}
		ship_factories[i] = _factory
	}
}





#endregion





#region Card Books
#region Level 1 Books

level_1_weapon_system_1[0] = 30
level_1_weapon_system_1[1] = o_armada_5_module_card

level_1_shield_module_1[0] = 10
level_1_shield_module_1[1] = o_arrack_refractor_module_card

level_1_armor_upgrade_1[0] = 30
level_1_armor_upgrade_1[1] = o_anvil_class_plates_module_card

level_1_targeting_module_1[0] = 30
level_1_targeting_module_1[1] = o_enhar_targeting_module_module_card

level_1_power_module_1[0] = 30
level_1_power_module_1[1] = o_arrack_core_plant_module_card

thermal_lance_1[0] = 30
thermal_lance_1[1] = o_thermal_lance_module_card

emergency_shield_1[0] = 30
emergency_shield_1[1] = o_emergency_shield_module_card

serrated_plates_1[0] = 30
serrated_plates_1[1] = o_serrated_plates_module_card

wave_crasher_shield_3[0] = 30//NOTE:  temporarily here in level 1.  needs to be in level 3
wave_crasher_shield_3[1] = o_wave_crasher_shield_module_card


//refrences to all level 1 books
level_1_module_book[0] = level_1_weapon_system_1
level_1_module_book[1] = level_1_shield_module_1
level_1_module_book[2] = level_1_armor_upgrade_1
level_1_module_book[3] = level_1_targeting_module_1
level_1_module_book[4] = emergency_shield_1
level_1_module_book[5] = level_1_power_module_1
level_1_module_book[6] = thermal_lance_1
level_1_module_book[7] = serrated_plates_1
level_1_module_book[8] = wave_crasher_shield_3//NOTE:  needs to move to level 3 book later
#endregion

#region Level 2 Books
level_2_weapon_system_1[0] = 30
level_2_weapon_system_1[1] = o_module_card_parent// o_duocannon_railgun_module_card

level_2_shield_module_1[0] = 30
level_2_shield_module_1[1] = o_module_card_parent// o_sun_shield_module_card

level_2_armor_upgrade_1[0] = 30
level_2_armor_upgrade_1[1] = o_module_card_parent// o_prism_skin_module_card

level_2_targeting_module_1[0] = 30
level_2_targeting_module_1[1] = o_module_card_parent// o_sniper_module_module_card

level_2_ability_module_1[0] = 30
level_2_ability_module_1[1] = o_module_card_parent// o_bombardment_cannon_module_card

level_2_power_module_1[0] = 30
level_2_power_module_1[1] = o_module_card_parent// o_hyperdrive_module_card

level_2_module_book[0] = level_2_weapon_system_1
level_2_module_book[1] = level_2_shield_module_1
level_2_module_book[2] = level_2_armor_upgrade_1
level_2_module_book[3] = level_2_targeting_module_1
level_2_module_book[4] = level_2_ability_module_1
level_2_module_book[5] = level_2_power_module_1
#endregion

#region Level 3 Books
level_3_weapon_system_1[0] = 30
level_3_weapon_system_1[1] = o_module_card_parent// o_thermal_javelin_module_card

level_3_shield_module_1[0] = 30
level_3_shield_module_1[1] = o_module_card_parent// o_enhar_dissipater_module_card

level_3_armor_upgrade_1[0] = 30
level_3_armor_upgrade_1[1] = o_module_card_parent// o_neosteel_plates_module_card

level_3_targeting_module_1[0] = 30
level_3_targeting_module_1[1] = o_module_card_parent// o_shipbreaker_ECM_module_card

level_3_ability_module_1[0] = 30
level_3_ability_module_1[1] = o_module_card_parent// o_electric_swing_module_card

level_3_power_module_1[0] = 30
level_3_power_module_1[1] = o_module_card_parent// o_post_fission_plant_module_card

level_3_module_book[0] = level_3_weapon_system_1
level_3_module_book[1] = level_3_shield_module_1
level_3_module_book[2] = level_3_armor_upgrade_1
level_3_module_book[3] = level_3_targeting_module_1
level_3_module_book[4] = level_3_ability_module_1
level_3_module_book[5] = level_3_power_module_1
#endregion

#region Ship Frames Book
ship_frame_book = array_create(15, noone)
interceptor_frame_book = 0
fighter_frame_book = 0
frigate_frame_book = 0
/*
TODO

At the current moment, there are TWO different systems being built.  The first system, involving the 
ship_frame_book is the old system.  It will be phased out.

When the new system is in place, the first two lines of each entry should be deleted.
*/

ship_frame_book[0, 0] = o_iron_interceptor_frame_card
ship_frame_book[0, 1] = 30
iron_interceptor_frame_book[0, 0] = o_iron_interceptor_frame_card
iron_interceptor_frame_book[0, 1] = 30
interceptor_frame_book[0] = iron_interceptor_frame_book

ship_frame_book[1, 0] = o_iron_fighter_frame_card
ship_frame_book[1, 1] = 20
iron_fighter_frame_book[0, 0] = o_iron_fighter_frame_card
iron_fighter_frame_book[0, 1] = 20
fighter_frame_book[0] = iron_fighter_frame_book

ship_frame_book[2, 0] = o_iron_frigate_frame_card
ship_frame_book[2, 1] = 10
iron_frigate_frame_book[0, 0] = o_iron_frigate_frame_card
iron_frigate_frame_book[0, 1] = 10
frigate_frame_book[0] = iron_frigate_frame_book

ship_frame_book[3, 0] = o_crystal_interceptor_frame_card
ship_frame_book[3, 1] = 30
crystal_interceptor_frame_book[0, 0] = o_crystal_interceptor_frame_card
crystal_interceptor_frame_book[0, 1] = 30
interceptor_frame_book[1] = crystal_interceptor_frame_book

ship_frame_book[4, 0] = o_crystal_fighter_frame_card
ship_frame_book[4, 1] = 20
crystal_fighter_frame_book[0, 0] = o_crystal_fighter_frame_card
crystal_fighter_frame_book[0, 1] = 20
fighter_frame_book[1] = crystal_fighter_frame_book

ship_frame_book[5, 0] = o_crystal_frigate_frame_card
ship_frame_book[5, 1] = 10
crystal_frigate_frame_book[0, 0] = o_crystal_frigate_frame_card
crystal_frigate_frame_book[0, 1] = 10
frigate_frame_book[1] = crystal_frigate_frame_book

ship_frame_book[6, 0] = o_pirate_interceptor_frame_card
ship_frame_book[6, 1] = 30
pirate_interceptor_frame_book[0, 0] = o_pirate_interceptor_frame_card
pirate_interceptor_frame_book[0, 1] = 30
interceptor_frame_book[2] = pirate_interceptor_frame_book

ship_frame_book[7, 0] = o_pirate_fighter_frame_card
ship_frame_book[7, 1] = 20
pirate_fighter_frame_book[0, 0] = o_pirate_fighter_frame_card
pirate_fighter_frame_book[0, 1] = 20
fighter_frame_book[2] = pirate_fighter_frame_book

ship_frame_book[8, 0] = o_pirate_frigate_frame_card
ship_frame_book[8, 1] = 10
pirate_frigate_frame_book[0, 0] = o_pirate_frigate_frame_card
pirate_frigate_frame_book[0, 1] = 10
frigate_frame_book[2] = pirate_frigate_frame_book

ship_frame_book[9, 0] = o_imperial_interceptor_frame_card
ship_frame_book[9, 1] = 30
imperial_interceptor_frame_book[0, 0] = o_imperial_interceptor_frame_card
imperial_interceptor_frame_book[0, 1] = 30
interceptor_frame_book[3] = imperial_interceptor_frame_book

ship_frame_book[10, 0] = o_imperial_fighter_frame_card
ship_frame_book[10, 1] = 20
imperial_fighter_frame_book[0, 0] = o_imperial_fighter_frame_card
imperial_fighter_frame_book[0, 1] = 20
fighter_frame_book[3] = imperial_fighter_frame_book

ship_frame_book[11, 0] = o_imperial_frigate_frame_card
ship_frame_book[11, 1] = 10
imperial_frigate_frame_book[0, 0] = o_imperial_frigate_frame_card
imperial_frigate_frame_book[0, 1] = 10
frigate_frame_book[3] = imperial_frigate_frame_book

ship_frame_book[12, 0] = o_solar_interceptor_frame_card
ship_frame_book[12, 1] = 30
solar_interceptor_frame_book[0, 0] = o_solar_interceptor_frame_card
solar_interceptor_frame_book[0, 1] = 30
interceptor_frame_book[4] = solar_interceptor_frame_book

ship_frame_book[13, 0] = o_solar_fighter_frame_card
ship_frame_book[13, 1] = 20
solar_fighter_frame_book[0, 0] = o_solar_fighter_frame_card
solar_fighter_frame_book[0, 1] = 20
fighter_frame_book[4] = solar_fighter_frame_book

ship_frame_book[14, 0] = o_solar_frigate_frame_card
ship_frame_book[14, 1] = 10
solar_frigate_frame_book[0, 0] = o_solar_frigate_frame_card
solar_frigate_frame_book[0, 1] = 10
frigate_frame_book[4] = solar_frigate_frame_book





#endregion


#endregion

scr_create_shuffled_shop(card_type.frame)














