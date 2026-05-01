if (is_active) {
    sprite_index = spr_lithearth
    image_speed = 0.2
	
	part_system_automatic_draw(fire_fx, true)
    part_system_automatic_update(fire_fx, true)
    part_system_position(fire_fx, x, y)
	
	part_system_automatic_draw(smoke_fx, false)
    part_system_automatic_update(smoke_fx, false)
} else {
    sprite_index = spr_hearth
    image_speed = 0
    image_index = 0
	
	part_system_automatic_draw(fire_fx, false)
    part_system_automatic_update(fire_fx, false)
	
	part_system_automatic_draw(smoke_fx, true)
    part_system_automatic_update(smoke_fx, true)
    part_system_position(smoke_fx, x, y)
}