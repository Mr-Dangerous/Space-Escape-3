///@param card_type
//enum set up as card_type.frame and card_type.module
var card_type = argument0
selected_card[0] = 0
selected_card[1] = 0
selected_card[2] = card_type


if (card_type = card_type.module){
	var card_level = 1//scr_return_card_level()

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
		repeat(card_repeats){
			remaining_leveled_cards[k] = selected_book
			k++
		}
	}
	//shuffle the array
	//hey, is this even needed?
	var array_size = array_length_1d(remaining_leveled_cards) -1
	/*
	repeat (array_size){
		var random_number_1 = irandom(array_size)
		var random_number_2 = irandom(array_size)
		while (random_number_1 = random_number_2){
			random_number_2 = irandom(array_size)
		}
		var card_1 = remaining_leveled_cards[random_number_1]
		var card_2 = remaining_leveled_cards[random_number_2]
	
		remaining_leveled_cards[random_number_1] = card_2
		remaining_leveled_cards[random_number_2] = card_1
	}
	*/

	var random_number = irandom(array_size)

	selected_book = remaining_leveled_cards[random_number]

	selected_book[@ 0]-= 1
	selected_card[0] = selected_book[1]
	selected_card[1] = selected_book

	
}
if (card_type = card_type.frame){
	//add every single ship frame exsisting to an array...
	var number_of_remaining_ship_frame_types = array_length_1d(ship_frame_book)
	var remaining_ship_frames
	var _k = 0
	for (var i = 0; i < number_of_remaining_ship_frame_types; i++){
		var number_of_frames = ship_frame_book[i, 1]
		repeat(number_of_frames){
			
			remaining_ship_frames[_k, 0] = ship_frame_book[i, 0]
			remaining_ship_frames[_k, 1] = i//references which book to add or subtract from
			_k++
		}
	}

	var _random_seed = irandom(_k)
	selected_card[0] = remaining_ship_frames[_random_seed, 0]
	selected_card[1] = remaining_ship_frames[_random_seed, 1]
		
	ship_frame_book[@ selected_card[1], 1] -=1 
}
return selected_card







