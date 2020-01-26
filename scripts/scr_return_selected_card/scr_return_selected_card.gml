///@param card_type
//enum set up as card_type.frame and card_type.module
var _card_type = argument0
//selected_card[0] = 0 //the resource
//selected_card[1] = 0 //the book refrence....
//selected_card[2] = _card_type
var _selected_card_book


if (_card_type = card_type.module){
	var card_level = scr_return_card_level(card_type.module)

	var _card_level_book
	switch(card_level){
		case 1:
			_card_level_book = level_1_module_book
		break;
		case 2:
			_card_level_book = level_2_module_book
		break;
		case 3:
			_card_level_book = level_3_module_book
		break;
		/*case 4:
			card_level_book = level_4_module_book
		break;
		case 5:
			card_level_book = level_5_module_book
		break;
		*/
	}
	var _module_book_size = array_length_1d(_card_level_book)
//create the list to insert the ship frame into to randomly select
	var _remaining_modules = ds_list_create()

	for (var i = 0; i < _module_book_size; i++){
		//get the resource.  This resource is an array. 0 is the resource, 1 is the quantity of ships remaining
		var _book_reference = _card_level_book[i]
		//insert the book reference into the array?
		repeat (_book_reference[1]){
			ds_list_add(_remaining_modules, _book_reference)
		}
	}
	var _remaining_module_number = ds_list_size(_remaining_modules) - 1 //might not need -1
	var _random_seed = irandom(_remaining_module_number)

	//select the frame
	_selected_card_book= ds_list_find_value(_remaining_modules, _random_seed)
	//destroy the list
	ds_list_destroy(_remaining_modules)

}

if (_card_type = card_type.frame){
	//add every single ship frame exsisting to an array...
	//script to choose frame type
	var _ship_class = scr_choose_ship_class()
	var _selected_card_book = scr_choose_frame(_ship_class)
}


_selected_card_book[@1] -= 1
var _selected_card_object = instance_create_layer(-50, -50, "Cards", o_ship_frame_parent)//o_card eventually
var _ship_stats = ship_maps[? _selected_card_book[0]]
with (_selected_card_object){
	//CONSIDERATION: you may want to have ALL stats in this]//because you might want to hover for them!
	name = string(_ship_stats[? "Name"])
	class = string(_ship_stats[? "Class"])
	sub_class = string(_ship_stats[? "Sub Class"])
	origin = string(_ship_stats[? "Origin"])
	var _sprite = asset_get_index(string(_ship_stats[? "sprite"] + "_original"))
	sprite_index = _sprite
	card_book = _selected_card_book
}
return _selected_card_object







