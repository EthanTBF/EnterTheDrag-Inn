var hearth = instance_find(obj_hearth, 0);

// --- 1. COOKING LOGIC ---
if (has_steak && !is_stolen) {
    sprite_index = spr_new_stove_occupied;
    
    if (hearth != noone && hearth.is_active) {
        cook_progress += cooking_speed;
        cook_progress = clamp(cook_progress, 0, max_cook);
        
        // Handle Particles based on progress
        if (cook_progress < (max_cook * 0.8)) {
            part_system_automatic_draw(stove_smoke, true);
            part_system_automatic_draw(stove_fire, false);
        } else {
            part_system_automatic_draw(stove_smoke, false);
            part_system_automatic_draw(stove_fire, true);
        }
    } 
    else {
        // Hearth is out: Even if there is meat, stop particles
        part_system_automatic_draw(stove_smoke, false);
        part_system_automatic_draw(stove_fire, false);
    }
} 
else if (is_stolen) {
    // Meat is stolen: Stop everything and show vacant
    sprite_index = spr_new_stove_vacant; 
    part_system_automatic_draw(stove_smoke, false);
    part_system_automatic_draw(stove_fire, false);
} 
else {
    // NO MEAT: Explicitly turn off both systems [Fix for your issue]
    sprite_index = spr_new_stove_vacant;
    part_system_automatic_draw(stove_smoke, false);
    part_system_automatic_draw(stove_fire, false);
}

// --- 2. INTERACTION LOGIC ---
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

// --- 3. FAIL CONDITION ---
if (has_steak && cook_progress >= max_cook) {
    obj_game_manager.current_strikes += 1;

    has_steak = false;
    cook_progress = 0;
    cooking_item = "none";
    cooking_sprite = noone;

    // Reset particles immediately when meat is ruined
    part_system_automatic_draw(stove_smoke, false);
    part_system_automatic_draw(stove_fire, false);
}