secondary_explosion_sprite = choose(s_explosion_multi_burst_original, s_explosion_nova_original)
explosion_image_scale = 0
switch(projectile_class){
	case projectile.rocket:
		
	 
	break;
	
	case projectile.missile:
		explosion_image_scale = 128 / secondary_explosion_sprite.sprite_width
	break;
	
	case projectile.torpedo:
		explosion_image_scale = 256 / secondary_explosion_sprite.sprite_width
	break;
}
