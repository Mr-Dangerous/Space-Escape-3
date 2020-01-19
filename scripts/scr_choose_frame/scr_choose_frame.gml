///@param class
var _class = argument0
var _ship_frame_resource = array_create(2, 0)
var _frame_type_book
var _frame_book
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

var _frame_book_size = array_length_1d(_frame_type_book)

var _remaining_frames_in_pool = ds_list_create()
for (var i = 0; i < _frame_book_size; i++){//possible needs to be -1
	_frame_book = _frame_type_book[i]
	var _number_of_repeats = _frame_book[1] //this didn't need to be a 2d array ;[
	repeat (_number_of_repeats){
		ds_list_add(_remaining_frames_in_pool, _frame_book[0])
	}
}

var _remaining_frame_number = ds_list_size(_remaining_frames_in_pool) - 1

var _random_seed = irandom(_remaining_frame_number)

_ship_frame_resource[0] = ds_list_find_value(_remaining_frames_in_pool, _random_seed)
ds_list_destroy(_remaining_frames_in_pool)

//decrement the number of frames
_frame_book[1] -= 1
_ship_frame_resource[1] = _frame_book//think aobut refactoring this
return _ship_frame_resource