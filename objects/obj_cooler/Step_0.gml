if (distance_to_object(obj_player) < 32) {
    var hearth = instance_find(obj_hearth, 0);
    
    if (hearth != noone && hearth.is_active) {
        if (keyboard_check_pressed(ord("E")) && !global.is_interacting) {
            
            if (!instance_exists(obj_ui_cooler_station)) {
                instance_create_depth(0, 0, -10000, obj_ui_cooler_station);
            }
            
            global.is_interacting = true;
            global.game_paused = true;
            obj_player.can_move = false;
            obj_player.speed = 0;
			audio_play_sound(Blip6, 130, false);
        }
    }
}