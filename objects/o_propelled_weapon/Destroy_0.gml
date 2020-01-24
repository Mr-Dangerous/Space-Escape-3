
if (!misfire){
var destroyed_projectile = instance_create_layer(x, y, "Effects", o_missile_explosion)
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
if (projectile_class != projectile.rocket){
	var explosion = instance_create_layer(x, y, "Effects", o_missile_explosion)
	with (explosion){
		//add some damage
		sprite_index = other.secondary_explosion_sprite
		image_xscale = other.explosion_image_scale//BUG
		image_yscale = other.explosion_image_scale
		visible = true
		image_angle = other.image_angle
		direction = other.image_angle
		speed = 0
		team_attack_from = other.team_attack_from
		damage = other.damage
	}
}