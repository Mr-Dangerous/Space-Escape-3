///@param class
var _class = argument0
var _ship_frame_resource = array_create(2, 0)
var _frame_type_book

//select the actual class book eg interceptor_Frame_book
switch (_class){
	case "Interceptor":
		_frame_type_book = interceptor_frame_book
	break;
	
	case "Fighter":
		_frame_type_book = fighter_frame_book
	break;
	
	case "Frigate":
		_frame_type_book = frigate_frame_book
	break;
}

//create a list of every remaining ship frame.
//list items should contain both the actual resource for the frame
//and also a reference to the specific book

var _frame_type_book_size = array_length_1d(_frame_type_book)
//create the list to insert the ship frame into to randomly select
var _remaining_ship_frames = ds_list_create()

for (var i = 0; i < _frame_type_book_size; i++){
	//get the resource.  This resource is an array. 0 is the resource, 1 is the quantity of ships remaining
	var _book_reference = _frame_type_book[i]
	//insert the book reference into the array?
	repeat (_book_reference[1]){
		ds_list_add(_remaining_ship_frames, _book_reference)
	}
}
//select a book reference at random from the list
var _remaining_frame_number = ds_list_size(_remaining_ship_frames) - 1
var _random_seed = irandom(_remaining_frame_number)

//select the frame
_ship_frame_resource = ds_list_find_value(_remaining_ship_frames, _random_seed)
//destroy the list
ds_list_destroy(_remaining_ship_frames)
//decrement the book number


return _ship_frame_resource