var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// Prevent same E press that opened the UI from closing it immediately
if (close_delay > 0) {
    close_delay--;
}

// Close topping UI
if (close_delay <= 0) {
    if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(ord("E"))) {
        global.game_paused = false;
        global.is_interacting = false;
        obj_player.can_move = true;
        instance_destroy();
        exit;
    }
}

// Message countdown
if (message_timer > 0) {
    message_timer--;
}


// ===============================
// DRAG TOPPING FROM LEFT SLOT
// ===============================
if (mouse_check_button_pressed(mb_left) && !is_dragging_topping) {

    // Bacon slot hitbox
    var bacon_x = popup_left + bacon_slot_x;
    var bacon_y = popup_top + bacon_slot_y;

    if (point_in_rectangle(
        mx, my,
        bacon_x - 120,
        bacon_y - 120,
        bacon_x + 120,
        bacon_y + 120
    )) {
        is_dragging_topping = true;
        drag_topping_name = "bacon";
        drag_topping_sprite = spr_bacon;
    }


    // Bun slot hitbox
    var bun_x = popup_left + bun_slot_x;
    var bun_y = popup_top + bun_slot_y;

    if (point_in_rectangle(
        mx, my,
        bun_x - 120,
        bun_y - 120,
        bun_x + 120,
        bun_y + 120
    )) {
        is_dragging_topping = true;
        drag_topping_name = "bun";
        drag_topping_sprite = spr_bun;
    }
}


// ===============================
// DROP TOPPING ONTO PLATE / BURGER
// ===============================
if (mouse_check_button_released(mb_left) && is_dragging_topping) {

    var dropped_on_plate = point_distance(mx, my, meal_x, meal_y) < meal_drop_radius;

    if (dropped_on_plate) {

        // Correct item
        if (obj_player.holding_item == "patty_meal") {

            obj_player.holding_item = "patty_meal_with_topping";
            obj_player.holding_sprite = spr_patty_meal_with_topping;

            message = "Burger completed!";
            message_timer = 60;

            audio_play_sound(Blip6, 130, false);
        }

        // Already topped
        else if (obj_player.holding_item == "patty_meal_with_topping") {

            message = "Burger already has topping!";
            message_timer = 90;
        }

        // Wrong item
        else {

            message = "Need cooked patty meal first!";
            message_timer = 90;
        }
    }
    else {
        message = "Drop topping onto burger!";
        message_timer = 60;
    }

    is_dragging_topping = false;
    drag_topping_name = "none";
    drag_topping_sprite = noone;
}