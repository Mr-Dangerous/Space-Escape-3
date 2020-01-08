player_experience += 2
scr_return_player_level()
resources += income
current_turn++
if (current_turn%3){
	scr_create_shuffled_shop(card_type.module)
} else {
	scr_create_shuffled_shop(card_type.frame)
}