// Stop player movement when in station
obj_player.can_move = false
obj_player.speed = 0

// Determine which steak sprite to display based on progress
var p = linked_stove.cook_progress;
current_steak_sprite = spr_steak_raw; // Default

if (p >= 150) {
    current_steak_sprite = spr_steak_burnt;
} else if (p >= 100) {
    current_steak_sprite = spr_steak_cooked;
} else if (p >= 50) {
    current_steak_sprite = spr_steak_partial;
}

// Mouse positioning for grabbing logic
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

if (mouse_check_button_pressed(mb_left)) {
    // Check if mouse is clicking the raw steak
    // We use a distance of 80px (can increase this if it's hard to click)
    if (point_distance(mx, my, ui_x + 500, ui_y) < 80) {
        is_dragging_steak = true;
    }
}

// Drop the Steak
if (mouse_check_button_released(mb_left)) {
    if (is_dragging_steak) {
        // Check if mouse is over the burner (ui_x, ui_y)
        if (point_distance(mx, my, ui_x, ui_y) < 120) {
            linked_stove.has_steak = true;
            linked_stove.cook_progress = 0; // Fresh steak starts at 0%
        }
        
        // Stop dragging regardless of where it was dropped
        is_dragging_steak = false;
    }
}

// Exit station
if (keyboard_check_pressed(vk_escape)) {
    obj_player.can_move = true; // Re-enable movement
    global.is_interacting = false;
    instance_destroy();
}