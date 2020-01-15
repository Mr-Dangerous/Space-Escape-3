instance_destroy(projectile_leader)
if (!misfire){
var destroyed_projectile = instance_create_layer(x, y, "Projectiles", o_missile_explosion)
	destroyed_projectile.sprite_index = explosion_sprite
	with (destroyed_projectile){
		image_xscale = other.image_scale
		image_yscale = other.image_scale
		visible = true
		image_angle = other.image_angle
		direction = other.direction
		speed = 0
	}
}
