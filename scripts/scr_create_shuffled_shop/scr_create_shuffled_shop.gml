

for(var i = 0; i < 5; i++){
	shop_slots[@ i, 0] = scr_return_selected_card()
	var _shop_item_reference = shop_slots[i, 0]
	var _shop_item_to_create =_shop_item_reference[0, 1]
	var shop_object = instance_create_layer(0, 0, "Cards", _shop_item_to_create[0, 1])
	with(shop_object){
		visible = false
	}
	shop_slots[@ i, 1] = shop_object
}
