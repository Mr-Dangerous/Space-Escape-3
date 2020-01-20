/// @description 

_card_game_controller = instance_find(o_card_game_ui, 0)
resolution_scale = _card_game_controller.resolution_scale

ship_deployed = false
create_ship = false
factory_team = team.left
new_ship = true

//module socket offests - assuming factories are origin center
socket_offsets[0, 0]= 0 //x
socket_offsets[0, 1]= 0//y
var _vertical_spacing = 24*resolution_scale

for (var i = 0; i < 3; i++){
	socket_offsets[i, 0] = 24*resolution_scale
	socket_offsets[i, 1] = (100*resolution_scale) - (_vertical_spacing*i)
	socket_offsets[i+3, 0] = 96*resolution_scale
	socket_offsets[i+3, 1] = (100*resolution_scale) - (_vertical_spacing*i)
}


factory_item[0, 0] = module.weapon//the type to compare agaisnt
factory_item[0, 1] = noone
factory_item[1, 0] = module.shields
factory_item[1, 1] = noone
factory_item[2, 0] = module.armor
factory_item[2, 1] = noone
factory_item[3, 0] = module.targeting
factory_item[3, 1] = noone
factory_item[4, 0] = module.ability
factory_item[4, 1] = noone
factory_item[5, 0] = module.power_plant
factory_item[5, 1] = noone


