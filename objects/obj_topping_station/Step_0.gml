if (distance_to_object(obj_player) < 64) {
    if (keyboard_check_pressed(ord("E")) && !global.is_interacting) {
        // Only open if holding a burger meal
        if (obj_player.holding_item == "meal") {
            var ui = instance_create_depth(0, 0, -1000, obj_ui_topping_station);
            global.is_interacting = true;
        }
    }
}