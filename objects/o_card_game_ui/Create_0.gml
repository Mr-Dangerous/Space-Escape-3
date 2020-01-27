/// @description Create... EVERYTHING!


//shop slots
for (var i = 0; i < 5; i++){
	shop_slots[i] = noone//the object

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
income_hover_timer = 0

//Game mangement variables
current_turn = 1
max_fuel = 7 + player_level*3

//Fleet management variables
left_fleet = ds_list_create()
right_fleet = ds_list_create()






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

//generate the timer location
timer_offset[0] = round(gui_width - 200*resolution_scale)
timer_offset[1] = round(100*resolution_scale)

//generate the timer variables
phase_timer = -1
planning_phase_length = 10*60 //45 seconds * 60 FPS
timer_counter = -1
timer = 0
game_phase = phase.planning
current_phase_text = ""
phase_debug_mode = false


#endregion

#region Creation Variables


//create the factories
ship_factories = array_create(16, noone)
factory_positions = array_create(16, [0, 0])

var _base_x_offset = 16 * resolution_scale
var _base_y_offset = 16 * resolution_scale
var _spacing = 132 * resolution_scale
for (var i = 0; i < 8; i++){
	factory_positions[i, 0] = _base_x_offset //x position
	factory_positions[i, 1] = _base_y_offset + (i*_spacing)
	factory_positions[i+8, 0] = _base_x_offset + _spacing
	factory_positions[i+8, 1] = _base_y_offset + (i*_spacing)
}
//create allied ship factories
var _factory_array_size = array_length_1d(factory_positions)
for (var i = 0; i < _factory_array_size; i++){
	if (factory_positions[i, 0] != 0){
		var _x = factory_positions[i, 0]
		var _y = factory_positions[i, 1]

		var _factory = instance_create_layer(100, 100, "Cards", o_ship_factory)
		with (_factory){
			card_game_controller = other
			factory_team = team.left
			gui_x = _x
			gui_y = _y
			
		}
		ship_factories[i] = _factory
	}
}
//create enemy ship factories - on screen for now!
enemy_ship_factories = array_create(16, noone)
enemy_factory_positions = array_create(16, [0, 0])
_base_x_offset = room_width - 250
_base_y_offset = 80
_spacing = 130
for (var i = 0; i < 8; i++){
	enemy_factory_positions[i, 0] = _base_x_offset //x position
	enemy_factory_positions[i, 1] = _base_y_offset + (i*_spacing)
	enemy_factory_positions[i+8, 0] = _base_x_offset + _spacing
	enemy_factory_positions[i+8, 1] = _base_y_offset + (i*_spacing)
}

var _factory_array_size = array_length_1d(enemy_factory_positions)
for (var i = 0; i < _factory_array_size; i++){
	if (enemy_factory_positions[i, 0] != 0){
		_x = enemy_factory_positions[i, 0]
		_y = enemy_factory_positions[i, 1]
		var _enemy_factory = instance_create_layer(_x, _y, "Cards", o_ship_factory)
		with (_enemy_factory){
			card_game_controller = other
			factory_team = team.right
		}
		enemy_ship_factories[i] = _enemy_factory
	}
}





#endregion


#region JSON funny business

var _buffer = buffer_load("Space_escape_cards.json");
var _json_string = buffer_read(_buffer, buffer_string)
buffer_delete(_buffer)
root_map = json_decode(_json_string)

//take the map data and put it into individual ship maps
var _list_of_ships = root_map[? "Ships"]
ship_maps = ds_map_create()
for (var i =0; i < ds_list_size(_list_of_ships); i++){
	var _ship_map = ds_list_find_value(_list_of_ships, i)
	var _map_key = _ship_map[? "Name"]
	ds_map_add(ship_maps, _map_key, _ship_map)
}
var _list_of_modules = root_map[? "Modules"]
module_maps = ds_map_create()
for (var i = 0; i <ds_list_size(_list_of_modules); i++){
	var _module_map = ds_list_find_value(_list_of_modules, i)
	var _map_key = _module_map[? "Name"]
	ds_map_add(module_maps, _map_key, _module_map)
}

//ds_map_destroy(root_map)//CONSIDERATION:  DONT DESTROY IF YOU NEED TO ITERATE!
//

#endregion

level_1_module_book = ds_list_create()
level_2_module_book = ds_list_create()
level_3_module_book = ds_list_create()
level_4_module_book = ds_list_create()
level_5_module_book = ds_list_create()
#region Card Books
for (var i = 0; i < ds_list_size(_list_of_modules); i++){
	var _card_book_array = array_create(2, 0)
	var _item_map = ds_list_find_index(_list_of_modules, i)
	_card_book_array[0] = _item_map[? "Name"]
	_card_book_array[1] = _item_map[? "Cards in Pool"]
	var _card_level = _item_map[? "Level"]
	var _selected_card_book
	switch(_card_level){
		case 1:
			_selected_card_book = level_1_module_book
		break;
		case 2:
			_selected_card_book = level_2_module_book
		break;
		case 3:
			_selected_card_book = level_3_module_book
		break;
		case 4:
			_selected_card_book = level_4_module_book
		break;
		case 5:
			_selected_card_book = level_5_module_book
		break;
	}
	ds_list_add(_selected_card_book, _card_book_array)
}
complete_module_book = ds_list_create()
complete_module_book[| 1] = level_1_module_book
complete_module_book[| 2] = level_2_module_book
complete_module_book[| 3] =level_3_module_book
complete_module_book[| 4] =level_4_module_book
complete_module_book[| 5] =level_5_module_book
//was here 1/26/20


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


iron_interceptor_frame_book[0] = "Iron Interceptor"
iron_interceptor_frame_book[1] = 30
interceptor_frame_book[0] = iron_interceptor_frame_book

iron_fighter_frame_book[0] = "Iron Fighter"
iron_fighter_frame_book[1] = 20
fighter_frame_book[0] = iron_fighter_frame_book


iron_frigate_frame_book[0] = "Iron Frigate"
iron_frigate_frame_book[1] = 10
frigate_frame_book[0] = iron_frigate_frame_book


crystal_interceptor_frame_book[0] = "Crystal Interceptor"
crystal_interceptor_frame_book[1] = 30
interceptor_frame_book[1] = crystal_interceptor_frame_book


crystal_fighter_frame_book[0] = "Crystal Fighter"
crystal_fighter_frame_book[1] = 20
fighter_frame_book[1] = crystal_fighter_frame_book


crystal_frigate_frame_book[0] = "Crystal Frigate"
crystal_frigate_frame_book[1] = 10
frigate_frame_book[1] = crystal_frigate_frame_book


pirate_interceptor_frame_book[0] = "Pirate Interceptor"
pirate_interceptor_frame_book[1] = 30
interceptor_frame_book[2] = pirate_interceptor_frame_book


pirate_fighter_frame_book[0] = "Pirate Fighter"
pirate_fighter_frame_book[1] = 20
fighter_frame_book[2] = pirate_fighter_frame_book


pirate_frigate_frame_book[0] = "Pirate Frigate"
pirate_frigate_frame_book[1] = 10
frigate_frame_book[2] = pirate_frigate_frame_book


imperial_interceptor_frame_book[0] = "Imperial Interceptor"
imperial_interceptor_frame_book[1] = 30
interceptor_frame_book[3] = imperial_interceptor_frame_book


imperial_fighter_frame_book[0] = "Imperial Fighter"
imperial_fighter_frame_book[1] = 20
fighter_frame_book[3] = imperial_fighter_frame_book


imperial_frigate_frame_book[0] = "Imperial Frigate"
imperial_frigate_frame_book[1] = 10
frigate_frame_book[3] = imperial_frigate_frame_book


solar_interceptor_frame_book[0] = "Solar Interceptor"
solar_interceptor_frame_book[1] = 30
interceptor_frame_book[4] = solar_interceptor_frame_book


solar_fighter_frame_book[0] = "Solar Fighter"
solar_fighter_frame_book[1] = 20
fighter_frame_book[4] = solar_fighter_frame_book


solar_frigate_frame_book[0] = "Solar Frigate"
solar_frigate_frame_book[1] = 10
frigate_frame_book[4] = solar_frigate_frame_book





#endregion


#endregion

scr_create_shuffled_shop(card_type.frame)














