duration--
if (duration <= 0) instance_destroy()

if (image_index >=2){
	image_speed = 0
}

if (instance_exists(projectile_leader)){
	with(projectile_leader){
		x = other.x
		y = other.y
		image_angle = other.image_angle
	}
}
