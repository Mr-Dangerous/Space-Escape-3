///@description 
//creation variables that need to be dynamically updated based on other variables


max_fuel = 10+(player_level*5)
level_income = floor(player_level/2)
investment_income = floor(resources/10)
income = base_income + streak_income + level_income + bonus_income + investment_income






//reset deploy button, and deploy the armada!
//TODO Just a thought - there shoudl likely be a check to see if the mouse is still in the correct
//position when released, in case the player wants to cancel a mouse click.  Shouldn't be too tough.


//phase machine lol
switch (game_phase){
	case phase.pre_planning:
	//create all ships in the factory
	break;
	case phase.planning:
	if (timer_counter > 0){
		timer_counter--
		timer = floor(timer_counter/60)
	}
	
	break;
	
	case phase.pre_combat:
	
	//some condition to start
	with(o_ship){
		state = ship.battle
	}
	game_phase = phase.combat
	
	break;
	
	case phase.combat:
		
	break;
	
	case phase.post_combat:
	
	break;
}


//actions
var mouse_left_released = mouse_check_button_released(mb_left)

if (mouse_left_released){
	
	//remove up to here
	if (invest_button_pressed){
		if (resources >= 4){
			invest_button_pressed = false
			player_experience+=4
			resources-=4
			scr_return_player_level()
		}
	}
	
	if (refresh_button_pressed){
		if (resources >= 2){
			refresh_button_pressed = false
			resources-=2
			scr_create_shuffled_shop(card_type.module)
		}
	}
	
	if (hangar_button_pressed){
		if (resources >= 1){
			hangar_button_pressed = false
			resources-=1
			scr_create_shuffled_shop(card_type.frame)
		}
	}
}
