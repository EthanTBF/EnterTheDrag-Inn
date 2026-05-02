// Safety check
if (linked_stove == noone) {
    obj_player.can_move = true;
    global.is_interacting = false;
    global.game_paused = false;
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

// Raw meat items from cooler
var player_has_raw_meat = (
    obj_player.holding_item == "chicken" ||
    obj_player.holding_item == "patty" ||
    obj_player.holding_item == "steak" ||
    obj_player.holding_item == "meat"
);

// Left click logic
if (mouse_check_button_pressed(mb_left)) {

    // Start dragging raw meat from right side of stove UI
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

                var meat_type = linked_stove.cooking_item;

                // Burnt pickup
                if (p >= 150) {
                    obj_player.holding_item = "burnt_meal";
                    obj_player.holding_sprite = spr_meal_burnt;
					audio_play_sound(Failure, 130, false);
                }
                // Correct cooked pickup
                else {
                    if (meat_type == "chicken") {
                        obj_player.holding_item = "chicken_meal";
                        obj_player.holding_sprite = spr_chicken_meal;
                    }
                    else if (meat_type == "patty") {
                        obj_player.holding_item = "patty_meal";
                        obj_player.holding_sprite = spr_patty_meal;
                    }
                    else if (meat_type == "steak" || meat_type == "meat") {
                        obj_player.holding_item = "steak_meal";
                        obj_player.holding_sprite = spr_steak_meal;
                    }
                    else {
                        obj_player.holding_item = "meal";
                        obj_player.holding_sprite = spr_meal;
                    }
					audio_play_sound(Blip6, 130, false);
                }
				
                linked_stove.has_steak = false;
                linked_stove.cook_progress = 0;
                linked_stove.cooking_item = "none";
                linked_stove.cooking_sprite = noone;
            }
        }
    }
}

// Drop raw meat onto burner
if (mouse_check_button_released(mb_left)) {

    if (is_dragging_steak) {

        // Drop onto stove burner
        if (point_distance(mx, my, ui_x, ui_y + 100) < 160) {

            if (!linked_stove.has_steak) {
                linked_stove.has_steak = true;
                linked_stove.cook_progress = 0;

                linked_stove.cooking_item = obj_player.holding_item;

                if (obj_player.holding_sprite != noone) {
                    linked_stove.cooking_sprite = obj_player.holding_sprite;
                } else {
                    linked_stove.cooking_sprite = spr_steak_raw;
                }

                obj_player.holding_item = "none";
                obj_player.holding_sprite = noone;
            }
        }
		audio_play_sound(Blip6, 130, false);
        is_dragging_steak = false;
        drag_sprite = noone;
    }
}

// Exit stove UI
if (keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_escape)) {
    obj_player.can_move = true;
    global.is_interacting = false;
    global.game_paused = false;
    instance_destroy();
}