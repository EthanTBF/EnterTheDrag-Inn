// Safety check
if (linked_stove == noone) {
    obj_player.can_move = true;
    global.is_interacting = false;
    instance_destroy();
    exit;
}

// Keep player still while stove UI is open
obj_player.can_move = false;
obj_player.hspeed = 0;
obj_player.vspeed = 0;
obj_player.speed = 0;

// Mouse position in GUI coordinates
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// Current cooking progress
var p = linked_stove.cook_progress;

// These count as raw meat items from the cooler
var player_has_raw_meat = (
    obj_player.holding_item == "meat" ||
    obj_player.holding_item == "steak" ||
    obj_player.holding_item == "chicken" ||
    obj_player.holding_item == "patty"
);

// Left click logic
if (mouse_check_button_pressed(mb_left)) {

    // Start dragging raw meat from the right side of the stove UI
    if (player_has_raw_meat && point_distance(mx, my, ui_x + 500, ui_y) < 80) {
        is_dragging_steak = true;

        if (obj_player.holding_sprite != noone) {
            drag_sprite = obj_player.holding_sprite;
        } else {
            drag_sprite = spr_steak_raw;
        }
    }

    // Pick up cooked/burnt meat from stove using plate
    if (point_distance(mx, my, ui_x, ui_y + 100) < 160) {
        if (linked_stove.has_steak && p >= 100) {
            if (obj_player.holding_item == "plate") {

                if (p >= 150) {
                    obj_player.holding_item = "burnt_meal";
                    obj_player.holding_sprite = noone;
                } else {
                    obj_player.holding_item = "meal";
                    obj_player.holding_sprite = noone;
                }

                linked_stove.has_steak = false;
                linked_stove.cook_progress = 0;

                if (variable_instance_exists(linked_stove, "cooking_sprite")) {
                    linked_stove.cooking_sprite = noone;
                }

                if (variable_instance_exists(linked_stove, "cooking_item")) {
                    linked_stove.cooking_item = "none";
                }
            }
        }
    }
}

// Drop raw meat onto the burner
if (mouse_check_button_released(mb_left)) {

    if (is_dragging_steak) {

        // Drop onto stove burner
        if (point_distance(mx, my, ui_x, ui_y + 100) < 160) {

            if (!linked_stove.has_steak) {
                linked_stove.has_steak = true;
                linked_stove.cook_progress = 0;

                // Save what meat was placed on the stove
                linked_stove.cooking_item = obj_player.holding_item;

                if (obj_player.holding_sprite != noone) {
                    linked_stove.cooking_sprite = obj_player.holding_sprite;
                } else {
                    linked_stove.cooking_sprite = spr_steak_raw;
                }

                // Remove meat from player's hands
                obj_player.holding_item = "none";
                obj_player.holding_sprite = noone;
            }
        }

        // Stop dragging either way
        is_dragging_steak = false;
        drag_sprite = noone;
    }
}

// Exit stove UI
if (keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_escape)) {
    obj_player.can_move = true;
    global.is_interacting = false;
    instance_destroy();
}