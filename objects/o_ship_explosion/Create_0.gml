/// @description particlaes!

var _number_of_particles = irandom_range(4, 7)

for (var i = 0; i < _number_of_particles; i++){
	var _particle = instance_create_layer(x, y, "Effects", o_explosion_particles)
	var image_scale = random_range(.25, .5)
	with(_particle){
		direction = random(359)
		image_xscale = image_scale
		image_yscale = image_scale
		rotation = random_range(-3, 3)
		image_angle = direction
		speed = random_range(2, 6)
		duration = irandom_range(80, 180)
	}
}