projectile_leader = instance_create_layer(x, y, "Projectiles", o_projectile_leader)
with (projectile_leader){
	origin_team = other.team_attack_from
	image_angle = other.image_angle
	
}

