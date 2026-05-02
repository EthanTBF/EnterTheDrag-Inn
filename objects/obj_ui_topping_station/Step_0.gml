var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// Prevent the same E press that opened the UI from closing it immediately
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

// Only patty meals can receive burger toppings
var can_add_topping = (obj_player.holding_item == "patty_meal");

// If already topped, do not allow more toppings
var already_topped = (obj_player.holding_item == "patty_meal_with_topping");

// Start dragging topping
if (mouse_check_button_pressed(mb_left) && !is_dragging_topping) {

    if (already_topped) {
        message = "Burger already has topping!";
        message_timer = 90;
    }
    else if (!can_add_topping) {
        message = "Need cooked patty meal first!";
        message_timer = 90;
    }
    else {
        // Bacon/topping slot
        if (point_in_rectangle(
            mx, my,
            popup_x + bacon_slot_x - slot_w / 2,
            popup_y + bacon_slot_y - slot_h / 2,
            popup_x + bacon_slot_x + slot_w / 2,
            popup_y + bacon_slot_y + slot_h / 2
        )) {
            is_dragging_topping = true;
            drag_topping_name = "topping";
            drag_topping_sprite = spr_bacon;
        }

        // Bun/topping slot
        if (point_in_rectangle(
            mx, my,
            popup_x + bun_slot_x - slot_w / 2,
            popup_y + bun_slot_y - slot_h / 2,
            popup_x + bun_slot_x + slot_w / 2,
            popup_y + bun_slot_y + slot_h / 2
        )) {
            is_dragging_topping = true;
            drag_topping_name = "topping";
            drag_topping_sprite = spr_bun;
        }
    }
}

// Release topping
if (mouse_check_button_released(mb_left) && is_dragging_topping) {

    if (point_distance(mx, my, meal_x, meal_y) < meal_drop_radius) {

        if (obj_player.holding_item == "patty_meal") {
            obj_player.holding_item = "patty_meal_with_topping";
            obj_player.holding_sprite = spr_patty_meal_with_topping;

            message = "Burger completed!";
            message_timer = 60;

            audio_play_sound(Blip6, 130, false);
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