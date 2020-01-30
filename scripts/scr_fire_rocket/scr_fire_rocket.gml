///@param projectile_class

var _projectile_class = argument0

var image_scale_multiplier = 1

if(_projectile_class = projectile.missile) image_scale_multiplier = 1.2
if(_projectile_class = projectile.torpedo) image_scale_multiplier = 2



if (instance_exists(ship_target)){
	var _missile = instance_create_layer(x, y, "Projectiles", o_propelled_weapon)
	with (_missile){
		speed = 0
		sprite_index = s_missile_red_original
		explosion_sprite = s_missile_red_explosion_original
		image_scale = (32/sprite_width) * image_scale_multiplier
		image_xscale = image_scale
		image_yscale = image_scale
		image_speed = 5
		direction = point_direction(x, y, other.ship_target.x, other.ship_target.y)
		image_angle = direction
		projectile_class = _projectile_class
		damage = 100
		mass = 7
		projectile_target = other.ship_target
		duration = 1000
		
	}
	_missile.projectile_class = _projectile_class
}