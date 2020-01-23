/// @description Insert description here
// You can write your code in this editor

//assign the image scale

var largest_dimension = 0
if (sprite_height > sprite_width){
	largest_dimension = sprite_height
} else {
	largest_dimension = sprite_width
}
card_image_scale = 0
switch(class){
	case "Interceptor":
		image_scale = 64/largest_dimension
		card_image_scale = 100/largest_dimension
	
	break;
	
	case "Fighter":
		image_scale = 96/largest_dimension
		card_image_scale = 100/largest_dimension
		
	
	break;
	
	case "Frigate":
		image_scale = 128/largest_dimension
		card_image_scale = 100/largest_dimension

	break;
}




image_xscale = card_image_scale
image_yscale = card_image_scale
visible = false
image_speed = 0