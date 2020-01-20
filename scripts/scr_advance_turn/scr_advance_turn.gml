player_experience += 2
scr_return_player_level()
resources += income
var _income = instance_create_layer(resource_x_offset[1], resource_y_offset, "Above_Cards", o_sold_item)
_income.amount = income
current_turn++
if (current_turn%3){
	scr_create_shuffled_shop(card_type.module)
} else {
	scr_create_shuffled_shop(card_type.frame)
}