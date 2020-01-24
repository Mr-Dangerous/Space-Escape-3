/// @description adjust the variables

if (instance_exists(ship_frame_contained)){
	script_execute(ship_frame_contained.loading_script)
}
for (var i = 0; i < 6; i ++){
	if (instance_exists(factory_item[i, 1])){
		script_execute(factory_item[i, 1].loading_script)
	}
}
