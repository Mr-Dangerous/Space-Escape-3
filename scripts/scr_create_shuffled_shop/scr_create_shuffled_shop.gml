///@param card_type
//passes the card type into the scr_return_selected_card

var _card_type = argument0

//clear the shop
for(var i = 0; i < 5; i++){
	if (shop_slots[i, 0] != noone){
		
		var shop_item_reference = shop_slots[i, 0]
		var shop_item_object_reference = shop_slots[i, 1]
		//if module
		if (shop_item_reference[2] = card_type.module){
			var _card_book = shop_item_reference[1]
			_card_book[@ 0] += 1
			instance_destroy(shop_item_object_reference)
			shop_slots[@i, 0] = noone
			shop_slots[@i, 1] = noone
		}
		if (shop_item_reference[2] = card_type.frame){
			ship_frame_book[@ shop_item_reference[1], 1] += 1
			instance_destroy(shop_item_object_reference)
			shop_slots[@i, 0] = noone
			shop_slots[@i, 1] = noone
			
		}
	}
}

for(var i = 0; i < 5; i++){
	if (shop_slots[i, 0] = noone){
		var _card = scr_return_selected_card(_card_type)
		shop_slots[@ i, 0] = _card
		_shop_item_reference = shop_slots[i, 0]
		_shop_item_reference_card = _shop_item_reference[0]
		if (_shop_item_reference[2] = card_type.module){
			var shop_object = instance_create_layer(0, 0, "Cards", _shop_item_reference_card)
			with(shop_object){
				visible = false
				card_book = _card[1]
			}
			shop_slots[@ i, 1] = shop_object
		}
		if (_shop_item_reference[2] = card_type.frame){
			var ship_frame = instance_create_layer(0, 0, "Ships", _shop_item_reference_card)
			with (ship_frame){
				x = 0
				y = 0
				visible = true
			}
			shop_slots[@ i, 1] = ship_frame
		}
	}
}
