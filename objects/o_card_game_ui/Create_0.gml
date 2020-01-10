/// @description Insert description here
#region Creation Variables
player_experience = 0
player_level = 1
current_fuel_spent = 0
max_fuel = 5+player_level*3
resources = 10
current_turn = 1
base_income = 5
streak_income = 0
investment_income = 0
level_income = floor(player_level/2)
bonus_income = 0
income = base_income + streak_income + level_income + bonus_income
invest_button_pressed = false
refresh_button_pressed = false
hangar_button_pressed = false
left_fleet = array_create(35, noone)
right_fleet = array_create(35, noone)
master_left_fleet = array(35, noone)
master_right_fleet = array(35, noone)

//player experience levels
experience_to_level[0] = 0
experience_to_level[1] = 4
experience_to_level[2] = 10
experience_to_level[3] = 18
experience_to_level[4] = 28
experience_to_level[5] = 40
experience_to_level[6] = 54
experience_to_level[7] = 68
experience_to_level[8] = 80
experience_to_level[9] = 104
experience_to_level[10] = infinity



//shop slots
for (var i = 0; i < 5; i++){
shop_slots[i, 0] = noone//the object resource
shop_slots[i, 1] = noone//the actual object being referenced
}
//parts bin slots
number_of_parts_slots = 15
for (var i = 0; i < 15; i++){
	parts_slot[i] = noone
}
//construction bays
number_of_construction_bays = 3
construction_bays = array_create(number_of_construction_bays, 0)
for (var i = 0; i < number_of_construction_bays; i++){
	var construction_bay = array_create(8, noone)
	//all of these will be specifically object references
	//construction_bay[0] = noone//frame in slot
	//construction_bay[1] = noone//weapons_system
	//construction_bay[2] = noone//shield system
	//construction_bay[3] = noone//armor
	//construction_bay[4] = noone//targeting
	//construction_bay[5] = noone//ability
	//construction_bay[6] = noone//powerplant
	//construction_bay[7] = 0//ship_class
	//construction_bay[8] = 0//Engineer
	construction_bays[i] = construction_bay
}
#endregion



#region GUI locations and variables
//variables
construction_bay_deploy_button_pressed = array_create(3, false)


gui_height = view_get_hport(0)
gui_width = view_get_wport(0)
resolution_scale = view_get_wport(0)/camera_get_view_width(view_camera[0])

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

for (var i =0; i < number_of_construction_bays; i++){
	construction_bay_slot_ui_y_offset[i] = gui_height- (264*(i+1)*resolution_scale)
	construction_bay_slot_y_offset[i] = room_height - (264*(i+1))
}

//generate contruction bay socket positions
construction_bay_socket_offsets[0, 0] = 128 * resolution_scale //ship frame x
construction_bay_socket_offsets[0, 1] = 122 * resolution_scale// ship frame y
construction_bay_socket_offsets[1, 0] = 48 * resolution_scale//top left socket x
construction_bay_socket_offsets[1, 1] = 48 * resolution_scale//top left socket y
construction_bay_socket_offsets[2, 0] = 48 * resolution_scale//mid left socket x
construction_bay_socket_offsets[2, 1] = 128 * resolution_scale//mid left socket y
construction_bay_socket_offsets[3, 0] = 48 * resolution_scale//bot left socket x
construction_bay_socket_offsets[3, 1] = 208 * resolution_scale//bot left socket y
construction_bay_socket_offsets[4, 0] = 208 * resolution_scale//top right socket x
construction_bay_socket_offsets[4, 1] = 48 * resolution_scale//top right socket y
construction_bay_socket_offsets[5, 0] = 208 * resolution_scale//mid right socket x
construction_bay_socket_offsets[5, 1] = 128 * resolution_scale//mid right socket y
construction_bay_socket_offsets[6, 0] = 208 * resolution_scale//bot right socket x
construction_bay_socket_offsets[6, 1] = 208 * resolution_scale//bot right socket y

//generate construction bay string locations
construction_bay_string_offset[0, 0] = 0//name of frame offset from left x
construction_bay_string_offset[0, 1] = 0//name of frame offset from top y
construction_bay_string_offset[1, 0] = (256/2) * resolution_scale //Deploy button x offset
construction_bay_string_offset[1, 1] = 232*resolution_scale //deploy button y offset

//generate construction bay accetpable item locations
construction_bay_item_type[0] = module.frame
construction_bay_item_type[1] = module.weapon
construction_bay_item_type[2] = module.shields
construction_bay_item_type[3] = module.armor
construction_bay_item_type[4] = module.targeting
construction_bay_item_type[5] = module.ability
construction_bay_item_type[6] = module.power_plant

//generate repair bay position array
number_of_repair_bays = 3
repair_bay_slot_x_offset = (8 * resolution_scale)
repair_bay_slot_y_offset = array_create(3, 0)

for (var i =0; i < number_of_repair_bays; i++){
	repair_bay_slot_y_offset[i] = gui_height- (264*(i+1)*resolution_scale)
}

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
card_offset_sprite_x = 179*resolution_scale//the ships x_offset from the left top side of the card
card_offset_sprite_y = 75*resolution_scale//the ships y offset from the left top
card_text_offset_x = 16*resolution_scale // all card text will be the same x_offset
card_name_offset_y = 20*resolution_scale
card_class_offset_y = 65*resolution_scale
card_origin_offset_y = 120*resolution_scale
card_resource_cost_x = 198*resolution_scale
card_resource_cost_y = 40*resolution_scale

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

level_1_ability_module_1[0] = 30
level_1_ability_module_1[1] = o_elisar_emergency_shield_system_module_card

level_1_power_module_1[0] = 30
level_1_power_module_1[1] = o_arrack_core_plant_module_card


//refrences to all level 1 books
level_1_module_book[0] = level_1_weapon_system_1
level_1_module_book[1] = level_1_shield_module_1
level_1_module_book[2] = level_1_armor_upgrade_1
level_1_module_book[3] = level_1_targeting_module_1
level_1_module_book[4] = level_1_ability_module_1
level_1_module_book[5] = level_1_power_module_1
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














