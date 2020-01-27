///@description 
//creation variables that need to be dynamically updated based on other variables


max_fuel = 7+(player_level*3)
level_income = floor(player_level/2)
investment_income = floor(resources/10)
if (investment_income > 5){
	investment_income = 5
}
income = base_income + streak_income + level_income + bonus_income + investment_income






//reset deploy button, and deploy the armada!
//TODO Just a thought - there shoudl likely be a check to see if the mouse is still in the correct
//position when released, in case the player wants to cancel a mouse click.  Shouldn't be too tough.


//phase machine lol

if (phase_debug_mode){
	if (game_phase = phase.phase_debug_mode){
		game_phase = phase.planning
	}  else {
		game_phase = phase.phase_debug_mode
	}
}
switch (game_phase){
	case phase.phase_debug_mode:
		phase_timer = -1
		timer_counter = -1
		
	break;
	
	case phase.pre_planning:
	//create all ships in the factory
	
	//process income
	
	//temporary
	if (phase_timer = -1){
		phase_timer = 60 //CONSIDERATION: 1 second for animations and stuff
			with (o_ship_factory){
			if (factory_team = team.left and instance_exists(ship_frame_contained) and ship_deployed = true){
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
		//commands to spawn the enemy here
		var _enemy_fleet_number = 3 + ceil(current_turn/4)
		var _enemy_fleet_strength = 0 + floor (current_turn/5)
		//this returns a list of enemy ships.  The ships are represented by the following array
		//_enemy_ship[0] = grid x
		//_enemy_ship[1] = grid_y
		//_enemy_ship[2] = o_card_parent witht eh variables injected
		//_enemy_ship[3] = array of o_module_card_parent with the variables injected.
		//oh boy.
		var _enemy_fleet = scr_return_enemy_fleet(_enemy_fleet_number, _enemy_fleet_strength)
		
		for (var i = 0; i < ds_list_size(_enemy_fleet); i++){
			var _factory = enemy_ship_factories[i]
			if (instance_exists(_enemy_fleet[2])){
				_factory.ship_frame_contained = _enemy_fleet[2]
				var _module_list = _enemy_fleet[3]
				for (var j = 0; j < array_length_1d(_module_list); j++){
					if (instance_exists(_module_list[j])){
						_factory.factory_item[j, 1] = _module_list[j]
					}
				}
			}
			
		}
		
		
		for (var i = 0; i < array_length_1d(enemy_ship_factories); i++){
			var _factory = enemy_ship_factories[i]
			if (_factory.ship_frame_contained != noone){
				_factory.create_ship = true
			}
		}
		ds_list_destroy(_enemy_fleet)
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
		with (o_ship_factory){
			if (instance_exists(fielded_ship)){
				ship_deployed = true
			}
		}
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
		with (o_ship){
			state = ship.locked
		}
		with (o_projectile){
			instance_destroy()
		}
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

//hover over factories
