///@param card_type
//enum set up as card_type.frame and card_type.module
var _card_type = argument0
selected_card[0] = 0 //the resource
selected_card[1] = 0 //the book refrence....
selected_card[2] = _card_type


if (_card_type = card_type.module){
	var card_level = scr_return_card_level(card_type.module)

	card_level_book = 0
	switch(card_level){
		case 1:
			card_level_book = level_1_module_book
		break;
		case 2:
			card_level_book = level_2_module_book
		break;
		case 3:
			card_level_book = level_3_module_book
		break;
		/*case 4:
			card_level_book = level_4_module_book
		break;
		case 5:
			card_level_book = level_5_module_book
		break;
		*/
	}


	//this will create an array of every remaining level 1 card
	remaining_leveled_cards[0] = 0
	var k = 0
	var array_length = array_length_1d(card_level_book)
	for (var i = 0; i < array_length; i++){
		selected_book = card_level_book[i]

		var card_repeats = selected_book[0,0]
		if (card_repeats > 0){
			repeat(card_repeats){
				remaining_leveled_cards[k] = selected_book
				k++
			}
		}
	}

	var array_size = array_length_1d(remaining_leveled_cards) -1
	
	var random_number = irandom(array_size)

	selected_book = remaining_leveled_cards[random_number]
	show_debug_message(selected_book[0])
	selected_book[0]-= 1
	show_debug_message(selected_book[0])
	selected_card[0] = selected_book[1]
	selected_card[1] = selected_book

	
}
if (_card_type = card_type.frame){
	//add every single ship frame exsisting to an array...
	//script to choose frame type
	var _ship_class = scr_choose_ship_class()
	var _ship_frame = scr_choose_frame(_ship_class)
	
	
	selected_card[0] = _ship_frame[0]
	selected_card[1] = _ship_frame[1]
	
	
	
}
return selected_card







