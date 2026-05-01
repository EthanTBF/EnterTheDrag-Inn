if (distance_to_object(obj_player) < 40) {
    if (keyboard_check_pressed(ord("E")) && !global.is_interacting) {

        if (!instance_exists(obj_ui_topping_station)) {
            instance_create_depth(0, 0, -10000, obj_ui_topping_station);
        }

        global.is_interacting = true;
        global.game_paused = true;
        obj_player.can_move = false;
        obj_player.speed = 0;
    }
}