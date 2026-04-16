// Only cook if it has a steak
if (has_steak) {
    cook_progress += cooking_speed;
}

// Check for interaction
if (point_distance(x, y, obj_player.x, obj_player.y) < 64) {
    if (keyboard_check_pressed(ord("E")) && !global.is_interacting) {
        var ui = instance_create_depth(0, 0, -1000, obj_ui_stove);
        ui.linked_stove = id; // Give the UI a reference to THIS stove
        global.is_interacting = true;
    }
}