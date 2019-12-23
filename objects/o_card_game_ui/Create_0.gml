/// @description Insert description here
#region Creation Variables
player_level = 1
//shop slots
for (var i = 0; i < 5; i++){
shop_slots[i, 0] = noone//the object resource
shop_slots[i, 1] = noone//the actual object being referenced
}
//parts bin slots
for (var i = 0; i < 15; i++){
	parts_slot[i] = noone
}
#endregion

#region GUI locations
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
//generate parts bin position array
number_of_parts_slots = 15
parts_slot_ui_x_offset = array_create(15, 0)//this array is the x position of the parts bin
parts_slot_x_offset = array_create(15, 0)
parts_slot_ui_y_offset = gui_height - (210*resolution_scale)
parts_slot_y_offset = room_height - (210)
for (var i = 0; i < number_of_parts_slots; i++){
	parts_slot_ui_x_offset[i] = (385 + round((i* 81.6)))*resolution_scale
}
for (var i = 0; i < number_of_parts_slots; i++){
	parts_slot_x_offset[i] = (385 + round((i* 81.6)))
}
//generate construction bay position array
number_of_construction_bays = 3
construction_bay_slot_x_offset = gui_width - (264 * resolution_scale)
construction_bay_slot_y_offset = array_create(3, 0)

for (var i =0; i < number_of_construction_bays; i++){
	construction_bay_slot_y_offset[i] = gui_height- (264*(i+1)*resolution_scale)
}

//generate repair bay position array
number_of_repair_bays = 3
repair_bay_slot_x_offset = (8 * resolution_scale)
repair_bay_slot_y_offset = array_create(3, 0)

for (var i =0; i < number_of_repair_bays; i++){
	repair_bay_slot_y_offset[i] = gui_height- (264*(i+1)*resolution_scale)
}

//generate the x and y offsets for elements on each card
card_offset_sprite_x = 179*resolution_scale//the ships x_offset from the left top side of the card
card_offset_sprite_y = 75*resolution_scale//the ships y offset from the left top
card_text_offset_x = 16*resolution_scale // all card text will be the same x_offset
card_name_offset_y = 20*resolution_scale
card_class_offset_y = 65*resolution_scale
card_origin_offset_y = 120*resolution_scale

#endregion

#region Card Books
#region Level 1 Books

level_1_weapon_system_1[0] = 30
level_1_weapon_system_1[1] = o_armada_5_module_card

level_1_shield_module_1[0] = 30
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
ship_frame_book[0, 0] = o_ship_frame_parent//o_iron_interceptor_frame_card
ship_frame_book[0, 1] = 30

ship_frame_book[1, 0] = o_ship_frame_parent//o_iron_fighter_frame_card
ship_frame_book[1, 1] = 20

ship_frame_book[2, 0] = o_ship_frame_parent//o_iron_frigate_frame_card
ship_frame_book[2, 1] = 10

ship_frame_book[3, 0] = o_ship_frame_parent// o_crystal_interceptor_frame_card
ship_frame_book[3, 1] = 30

ship_frame_book[4, 0] = o_ship_frame_parent//o_crystal_fighter_frame_card
ship_frame_book[4, 1] = 20

ship_frame_book[5, 0] = o_ship_frame_parent//o_crystal_frigate_frame_card
ship_frame_book[5, 1] = 10

ship_frame_book[6, 0] = o_ship_frame_parent//o_pirate_interceptor_frame_card
ship_frame_book[6, 1] = 30

ship_frame_book[7, 0] = o_ship_frame_parent//o_pirate_fighter_frame_card
ship_frame_book[7, 1] = 20

ship_frame_book[8, 0] = o_ship_frame_parent//o_pirate_frigate_frame_card
ship_frame_book[8, 1] = 10

ship_frame_book[9, 0] = o_ship_frame_parent//o_imperial_interceptor_frame_card
ship_frame_book[9, 1] = 30

ship_frame_book[10, 0] = o_ship_frame_parent//o_imperial_fighter_frame_card
ship_frame_book[10, 1] = 20

ship_frame_book[11, 0] = o_ship_frame_parent//o_imperial_frigate_frame_card
ship_frame_book[11, 1] = 10

ship_frame_book[12, 0] = o_ship_frame_parent//o_solar_interceptor_frame_card
ship_frame_book[12, 1] = 30

ship_frame_book[13, 0] = o_ship_frame_parent//o_solar_fighter_frame_card
ship_frame_book[13, 1] = 20

ship_frame_book[14, 0] = o_ship_frame_parent//o_solar_frigate_frame_card
ship_frame_book[14, 1] = 10

#endregion


#endregion














