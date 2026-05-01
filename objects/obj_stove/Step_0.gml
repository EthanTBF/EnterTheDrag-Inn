var hearth = instance_find(obj_hearth, 0);

// Only cook if it has meat and hearth is active
if (has_steak && hearth != noone && hearth.is_active) {
    cook_progress += cooking_speed;
    cook_progress = clamp(cook_progress, 0, max_cook);
}

// Check for interaction
if (point_distance(x, y, obj_player.x, obj_player.y) < 64) {
    if (keyboard_check_pressed(ord("E")) && !global.is_interacting) {
        var ui = instance_create_depth(0, 0, -10000, obj_ui_stove);
        ui.linked_stove = id;

        global.is_interacting = true;
        global.game_paused = true;

        obj_player.can_move = false;
        obj_player.speed = 0;
        obj_player.hspeed = 0;
        obj_player.vspeed = 0;
    }
}

// Meat is ruined if left too long
if (has_steak && cook_progress >= max_cook) {
    obj_game_manager.current_strikes += 1;

    has_steak = false;
    cook_progress = 0;

    cooking_item = "none";
    cooking_sprite = noone;
}