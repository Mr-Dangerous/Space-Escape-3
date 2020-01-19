///@param card_type
//passes the card type into the scr_return_selected_card

var _card_type = argument0

//clear the shop
for(var i = 0; i < 5; i++){
	if (shop_slots[i] != noone){
		
		var shop_item_reference = shop_slots[i]
				
		shop_item_reference.card_book[@ 1] += 1
			
		instance_destroy(shop_item_reference)
		shop_slots[i] = noone
	}
}

for(var i = 0; i < 5; i++){
	if (shop_slots[i] = noone){
		shop_slots[@ i] = scr_return_selected_card(_card_type)
		
	}
}
