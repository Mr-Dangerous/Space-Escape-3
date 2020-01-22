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

if (keyboard_check(ord("L"))){
}
switch (game_phase){
	case phase.pre_planning:
	//create all ships in the factory
	
	//process income
	
	//temporary
	if (phase_timer = -1){
		phase_timer = 60 //CONSIDERATION: 1 second for animations and stuff
			with (o_ship_factory){
			if (factory_team = team.left){
				new_ship = false
				create_ship = true
			
			}
		}
	} 
	if (phase_timer > 0){
		phase_timer--
	}
	if (phase_timer = 0){
		phase_timer--
		game_phase = phase.planning
		timer_counter = -1
		current_phase_text = "Planning"
	}
	//needs to be something more intesting, maybe some phase text?
	


	break;
	case phase.planning:
	if (timer_counter <= 0){
		timer_counter = planning_phase_length
	}
	if (timer_counter > 0){
		timer_counter--
		timer = floor(timer_counter/60)
	}
	
	if (timer_counter = 0){
		timer_counter--
		game_phase = phase.pre_combat
		current_phase_text = "Precombat"
		phase_timer = -1
	}
	
	
	break;
	
	case phase.pre_combat:
	
	//some condition to start
	if (phase_timer = -1){
		phase_timer = 60
	}
	if (phase_timer > 0){
		phase_timer--
	}
	if (phase_timer = 0){
		phase_timer--
		with(o_ship){
			state = ship.battle
		}
		game_phase = phase.combat
		current_phase_text="Combat!"
		timer_counter = -1
	}
	break;
	
	case phase.combat:
	if (timer_counter = -1){
		timer_counter = planning_phase_length//to be replaced with combat!
	}
	if (timer_counter > 0){
		timer_counter--
		timer = floor(timer_counter/60)
	}
	if (timer_counter = 0){
		timer_counter--
		game_phase = phase.post_combat
		current_phase_text = "Post Combat"
		phase_timer = -1
	}
	break;
	
	case phase.post_combat:
	//remaining ships calculate player damage
	//eventually enemy damage
	//destroy all ships
	if (phase_timer = -1){
		phase_timer = 60
	}
	if (phase_timer > 0){
		phase_timer--
	}
	if (phase_timer = 0){
		with (o_ship){
			instance_destroy()
		}
		
		game_phase = phase.pre_planning
		current_phase_text = "Pre-planning"
		timer_counter = -1
		phase_timer = -1
		scr_advance_turn()
	}
		
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
