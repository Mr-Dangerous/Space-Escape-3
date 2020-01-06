instance_destroy(projectile_leader)
var destroyed_projectile = instance_create_layer(x, y, "Projectiles", o_projectile_destroyed)

with (destroyed_projectile){
	sprite_index = other.sprite_index
	image_xscale = other.image_xscale
	image_yscale = other.image_yscale
	visible = true
	image_angle = other.image_angle
	direction = other.direction
	speed = 0
	image_index = other.image_index
	image_speed = 1
}
