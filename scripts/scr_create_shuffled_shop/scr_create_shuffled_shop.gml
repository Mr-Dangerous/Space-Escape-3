

for(var i = 0; i < 5; i++){
	shop_slots[@ i, 0] = scr_return_selected_card()
	var shop_object = instance_create_layer(x, y, "Cards", shop_slots[i, 0])
	shop_slots[@ i, 1] = shop_object
}
