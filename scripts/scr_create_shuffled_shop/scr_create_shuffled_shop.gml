for(var i = 0; i < 5; i++){
	if (shop_slots[i, 0] != noone){
		var shop_item_reference = shop_slots[i, 0]
		var shop_item_object_reference = shop_slots[i, 1]
		var _card_book = shop_item_reference[1]
		_card_book[@ 0] += 1
		instance_destroy(shop_item_object_reference)
		shop_slots[@i, 0] = noone
		shop_slots[@i, 1] = noone
	}
}

for(var i = 0; i < 5; i++){
	if (shop_slots[i, 0] = noone){
		var _card = scr_return_selected_card()
		shop_slots[@ i, 0] = _card
		_shop_item_reference = shop_slots[i, 0]
		_shop_item_reference_card = _shop_item_reference[0]

		var shop_object = instance_create_layer(0, 0, "Cards", _shop_item_reference_card)
		with(shop_object){
			visible = false
			card_book = _card[1]
		}
		shop_slots[@ i, 1] = shop_object
	}
}
