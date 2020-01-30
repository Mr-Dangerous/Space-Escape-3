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
	if (keyboard_check_pressed(ord("O"))) timer_counter = 10
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
			var _ship = ds_list_find_value(_enemy_fleet, i)
			if (instance_exists(_ship[2])){
				_factory.ship_frame_contained = _ship[2]
				_factory.assigned_grid_x = _ship[0]
				_factory.assigned_grid_y = _ship[1]
				var _module_list = _ship[3]
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
				//this function may need to go into the ship factory
				var _fleet_list
				if (factory_team = team.left){
					_fleet_list = other.left_fleet
				}
				if (factory_team = team.right){
					_fleet_list = other.right_fleet
				}
				ship_deployed = true
				ds_list_add(_fleet_list, fielded_ship)
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
	var _one_team_has_won = true
	var _two_team_has_won = true
	for (var i = 0; i < ds_list_size(left_fleet); i++){
		var _ship = ds_list_find_value(left_fleet, i)
		if (instance_exists(_ship)){
			_one_team_has_won = false
			break;
		}
	}
	for (var i = 0; i < ds_list_size(right_fleet); i++){
		var _ship = ds_list_find_value(right_fleet, i)
		if (instance_exists(_ship)){
			_two_team_has_won = false
			break;
		}
	}
	if (timer_counter = 0 or _one_team_has_won = true or _two_team_has_won = true){
		timer_counter = -1
		game_phase = phase.post_combat
		current_phase_text = "Post Combat"
		phase_timer = -1
	}
	break;
	//likely needs to be a phase overtime
	
	
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
		//calculate player hp and enemy hp
		var _player_damage = 0
		var _enemy_damage = 0
		//calculate enemy damage first... caused why not
		for (var i = 0; i < ds_list_size(left_fleet); i++){
			var _ship = ds_list_find_value(left_fleet, i)
				if (instance_exists(_ship)){
				switch(_ship.class){
					case "Interceptor":
						_enemy_damage += 1
					break;
					
					case "Fighter":
						_enemy_damage += 2
					break;
					
					case "Frigate":
						_enemy_damage += 4
					break;
					
				}
			}
		}
		//calculate daamge to player
		for (var i = 0; i < ds_list_size(right_fleet); i++){
			var _ship = ds_list_find_value(right_fleet, i)
				if (instance_exists(_ship)){
				switch(_ship.class){
					case "Interceptor":
						_player_damage += 1
					break;
					
					case "Fighter":
						_player_damage += 2
					break;
					
					case "Frigate":
						_player_damage += 4
					break;
					
				}
			}
		}
		player_hp -= _player_damage
		enemy_hp -= _enemy_damage
		show_debug_message(string("Player HP: " + string(player_hp)))
		show_debug_message(string("Enemy HP: " + string(enemy_hp)))
		
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
	
	ds_list_clear(left_fleet)
	ds_list_clear(right_fleet)
		
	break;
}


//actions
var mouse_left_released = mouse_check_button_released(mb_left)

if (mouse_left_released){
	

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
