/// @description deploying and stat checking

//needs to be some kind of state check to see if
//you can actually do this, like checking what phase it is.
//phases will be int eh cardgame ui!

#region deploying
//will create a ship_clone object with a reference tot he factory.
//The clone will have code that when released, using the factory values
//will create the ship
//test something.....
//This is the original code that can be used if my changes don't work
/*
if (ship_frame_contained != noone and ship_deployed = false){
	var _deployment_clone = instance_create_layer(mouse_x, mouse_y, "Above Cards", o_ship_clone)
	with (_deployment_clone){
		new_ship = true
		reference_factory = other
		ship_team = team.left
		sprite_index = other.ship_frame_contained.sprite_index
		image_xscale = other.ship_frame_contained.image_scale
		image_yscale = other.ship_frame_contained.image_scale
	}
}
*/
//This code will hopefully allow one to reposition from the factory.
/*
if (ship_frame_contained != noone){
	var _deployment_clone = instance_create_layer(mouse_x, mouse_y, "Above Cards", o_ship_clone)
	with (_deployment_clone){
		new_ship = other.ship_deployed
		reference_factory = other
		ship_team = team.left
		sprite_index = other.ship_frame_contained.sprite_index
		image_xscale = other.ship_frame_contained.image_scale
		image_yscale = other.ship_frame_contained.image_scale
	}
}
*/


#endregion



