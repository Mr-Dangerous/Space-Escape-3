/// @description Create a ship resposition clone

if (state = ship.planning){
	var ship_reposition_clone = instance_create_layer(mouse_x, mouse_y, "Ships", o_ship_clone)
	with (ship_reposition_clone){
		sprite_index = other.sprite_index
		image_xscale = other.image_xscale*1.2
		image_yscale = other.image_yscale*1.2
		direction = other.direction
		image_angle = other.image_angle
		reference_factory = other.reference_factory
		ship_team = other.ship_team
		reference_object = other
	}
}
